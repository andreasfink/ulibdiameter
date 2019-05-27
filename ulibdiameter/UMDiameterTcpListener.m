//
//  UMDiameterTcpListener.m
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterTcpListener.h"
#import "UMDiameterRouter.h"
#import "UMDiameterTcpConnection.h"

@implementation UMDiameterTcpListener
#include <sys/types.h>
#include <netinet/in.h>
#include <unistd.h>


/*
The base Diameter protocol is run on port 3868 for both TCP [RFC0793]
and SCTP [RFC4960].  For TLS [RFC5246] and Datagram Transport Layer
Security (DTLS) [RFC6347], a Diameter node that initiates a
connection prior to any message exchanges MUST run on port 5658.  It
is assumed that TLS is run on top of TCP when it is used, and DTLS is
run on top of SCTP when it is used.

*/

#define UMDIAMETER_DEFAULT_PORT         3868
#define UMDIAMETER_DEFAULT_TLS_PORT     5658

/* HTTP methods accordings to RFC2616 */

- (id) init
{
	UMAssert(0, @"call initWithPort:socketType:tls:sslKeyFile:sslCertFile:taskQueue:sctpRegistry:sctpListener: instead");
	return NULL;
}

- (id) initWithPort:(in_port_t)port
         socketType:(UMSocketType)type
                tls:(BOOL)doTLS
         sslKeyFile:(NSString *)sslKeyFile
        sslCertFile:(NSString *)sslCertFile
          taskQueue:(UMTaskQueue *)tq
{
    self = [super init];
    if(self)
    {
      	_listenerTcp = [[UMSocket alloc] initWithType:type name:@"listener"];
        _sleeper        = [[UMSleeper alloc]initFromFile:__FILE__ line:__LINE__ function:__func__];
        [_sleeper prepare];

        _connections = [[UMSynchronizedArray alloc] init];
        _connectionsLock = [[UMMutex alloc]initWithName:@"diameter-connections-lock"];

        _terminatedConnections = [[UMSynchronizedArray alloc]init];
        _lock        = [[UMMutex alloc] init];
        _sslLock     = [[UMMutex alloc]init];
        _receivePollTimeoutMs = 5000;
        _useTLS = doTLS;
		_listenerName = [NSString stringWithFormat:@"diameter-listener-%d",port];
        if(tq)
        {
            _taskQueue = tq;
        }
        else
        {
            _taskQueue = [[UMTaskQueue alloc]initWithNumberOfThreads:ulib_cpu_count()
																name:_listenerName
													   enableLogging:NO];
            [_taskQueue start];
        }
        if(doTLS)
        {
            if(sslKeyFile)
            {
                [self setPrivateKeyFile:sslKeyFile];
            }
            if(sslCertFile)
            {
                [self setCertificateFile:sslCertFile];
            }
        }
    }
    return self;
}

- (UMSocketError) startTcp
{
    UMSocketError    sErr = UMSocketError_no_error;
    self.logFeed.copyToConsole = 1;

	_listenerTcp.objectStatisticsName = [NSString stringWithFormat: @"UMSocket(%@)",_listenerName];

    @autoreleasepool
    {
        if(self.status != UMDiameterTcpListenerStatus_notRunning)
        {
            [_logFeed majorError:0 withText:[NSString stringWithFormat:@"DiameterServer '%@' on port %d failed to start because its already started",_listenerName, [_listenerTcp requestedLocalPort]]];
            return UMSocketError_generic_error;
        }

        [_logFeed info:0 withText:[NSString stringWithFormat:@"DiameterServer '%@' on port %d is starting up",_listenerName, [_listenerTcp requestedLocalPort]]];
        [_lock lock];

        self.status = UMDiameterTcpListenerStatus_startingUp;
        [self runSelectorInBackground:@selector(mainListener)
                           withObject:NULL
                                 file:__FILE__
                                 line:__LINE__
                             function:__func__];

        [_sleeper reset];
        while(_status == UMDiameterTcpListenerStatus_startingUp)
        {
            [_sleeper sleep:100000];/* wait 100ms */
        }

        if( self.status == UMHTTPServerStatus_running )
        {
            sErr = UMSocketError_no_error;
        }
        else
        {
			sErr = _lastErr;

            self.status = UMHTTPServerStatus_notRunning;
        }

        [_lock unlock];

        if( self.status == UMHTTPServerStatus_running)
        {
            [self.logFeed info:0 withText:[NSString stringWithFormat:@"DiameterServer '%@' on port %d is running\n",_listenerName, [_listenerTcp requestedLocalPort]]];
        }
        else
        {
            [self.logFeed majorError:0 withText:[NSString stringWithFormat:@"HTTPServer '%@' on port %d failed to start due to '%@'\n",_listenerName, [_listenerTcp requestedLocalPort] ,[UMSocket getSocketErrorString:sErr]]];
        }
    }
    return sErr;
}

- (void) mainListener
{
    @autoreleasepool
    {
		NSString *s = [NSString stringWithFormat:@"DiameterListener %@",_listenerName];
        ulib_set_thread_name(s);

        /* performSelector will handle pool by itself */
        UMSocketError sErr = 0;
        UMSocketError pollResult;


        /*

         if an application is restarted, the port might come back with
         address is already in use as the kernel has not yet deallocated it
         from the old process. if thats the case, we will retry
         every second up to a minute

         */

        _listenerRunning = YES;
        int counter = 0;
        while(counter < 60)
        {
            sErr  = [_listenerTcp bind];
            if(sErr != UMSocketError_address_already_in_use)
            {
                break;
            }
            usleep(1000000);
            counter += 1;
        }
        if(!sErr)
        {
            sErr  = [_listenerTcp listen];
        }
        if(sErr == UMSocketError_no_error)
        {
            self.status = UMDiameterTcpListenerStatus_running;
        }
        else
        {
            self.lastErr = sErr;
            self.status = UMDiameterTcpListenerStatus_failed;
        }

        [_sleeper wakeUp];

        while(self.status == UMDiameterTcpListenerStatus_running)
        {
            @autoreleasepool
            {
                //NSLog(@"_receivePollTimeoutMs=%ld",_receivePollTimeoutMs);
                pollResult = [_listenerTcp dataIsAvailable:_receivePollTimeoutMs];
                if(pollResult == UMSocketError_has_data_and_hup)
                {
                    NSLog(@"  UMSocketError_has_data_and_hup");

                    /* we get connection request but nobody is there to read the answer so we ignore it */
                    ;
                }
                else if (pollResult == UMSocketError_has_data)
                {
                    /* we get new connection request */
                    UMSocketError ret1=UMSocketError_no_error;
                    UMSocket *clientSocket = [_listenerTcp accept:&ret1];
                    if(clientSocket)
                    {
                        clientSocket.useSSL=_useTLS;
                        clientSocket.serverSideKeyFilename  = _privateKeyFile;
                        clientSocket.serverSideKeyData      = _privateKeyFileData;
                        clientSocket.serverSideCertFilename = _certFile;
                        clientSocket.serverSideCertData     = _certFileData;

						UMDiameterTcpConnection *con = [[UMDiameterTcpConnection alloc] initWithSocket:clientSocket listener:self router:_router];
						con.name = [NSString stringWithFormat:@"DiameterConnection %@:%d",clientSocket.connectedRemoteAddress,clientSocket.connectedRemotePort];
						con.enableKeepalive = _enableKeepalive;
						UMDiameterPeer *peer = [_router getPeerForConnection:con];
						if(peer==NULL)
						{
							[clientSocket close];
							con = NULL;
						}
						else
						{
                            [_connections addObject:con];
						}
					}
                    else
                    {
                        _lastErr = ret1;
                    }
                }
                else if(pollResult == UMSocketError_no_data)
                {
                    usleep(10000); /* just to avoid too busy loops */
                }
                else
                {
                    _lastErr = pollResult;
                    self.status = UMHTTPServerStatus_failed;
                }
            }
            /* maintenance work */
            while ([_terminatedConnections count] > 0)
            {
                UMDiameterTcpConnection *con = [_terminatedConnections removeFirst];
                if(con==NULL)
                {
                    break;
                }
                [con terminate];
                con = NULL;
            }
        }
        self.status = UMDiameterTcpListenerStatus_shutDown;
        [_listenerTcp close];
        _listenerRunning = NO;
    }
}

-(UMDiameterTcpConnectionAuthorisationResult) authorizeIncomingDiameterTcpConnection:(UMSocket *)us
{
    if(_authorizeConnectionDelegate == NULL)
    {
		return UMDiameterTcpConnectionAuthorisationResult_successful;
	}
	return [_authorizeConnectionDelegate authorizeIncomingDiameterTcpConnection:us];
}

- (void) stopTcp
{
    [self.logFeed info:0 withText:[NSString stringWithFormat:@"DiameterListener on port %d is stopping\r\n",[_listenerTcp requestedLocalPort]]];

    if((self.status !=UMDiameterTcpListenerStatus_running) && (_listenerRunning!=YES))
    {
		[self.logFeed info:0 withText:[NSString stringWithFormat:@"DiameterListener on port %d was not running\r\n",[_listenerTcp requestedLocalPort]]];
        return;
    }
    self.status = UMDiameterTcpListenerStatus_shuttingDown;
    while(self.status == UMDiameterTcpListenerStatus_shuttingDown)
    {
        [_sleeper sleep:100]; /* wait 100ms */
    }
    self.status = UMDiameterTcpListenerStatus_notRunning;

    [self.logFeed info:0 withText:[NSString stringWithFormat:@"DiameterListener on port %d is stopped\r\n",[_listenerTcp requestedLocalPort]]];
}


- (void)connectionDone:(UMDiameterTcpConnection *)con
{
    if(con)
    {
        [_connectionsLock lock];
        [_connections removeObject:con];
        [_terminatedConnections addObject:con];
        [_connectionsLock unlock];
    }
}


- (void) setPrivateKeyFile:(NSString *)filename
{
    _privateKeyFile = filename;
    _privateKeyFileData = [NSData dataWithContentsOfFile:filename];

}

- (void) setCertificateFile:(NSString *)filename
{
    _certFile = filename;
    _certFileData = [NSData dataWithContentsOfFile:filename];

}

@end



