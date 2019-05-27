//
//  UMDiameterTcpListener.h
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibsctp/ulibsctp.h>
#import "UMDiameterTcpConnectionAuthorisationProtocol.h"
@class UMDiameterRouter;

typedef enum UMDiameterTcpListenerStatus
{
	UMDiameterTcpListenerStatus_notRunning = 0,
	UMDiameterTcpListenerStatus_startingUp,
	UMDiameterTcpListenerStatus_running,
	UMDiameterTcpListenerStatus_shuttingDown,
	UMDiameterTcpListenerStatus_shutDown,
	UMDiameterTcpListenerStatus_failed,
} UMDiameterTcpListenerStatus;


@interface UMDiameterTcpListener : UMObject
{
    in_port_t   				_port;
    UMSocket    				*_listenerTcp;
    BOOL        				_useTLS;
    id          				_authorizeConnectionDelegate;
	
	UMSynchronizedArray			*_connections;
	UMSynchronizedArray			*_terminatedConnections;
	UMMutex						*_connectionsLock;
    UMSleeper   				*_sleeper;

	UMMutex						*_lock;
	UMMutex						*_sslLock;
	UMTaskQueue         		*_taskQueue;
	int							_receivePollTimeoutMs;
	UMDiameterRouter			*_router;
	NSString					*_listenerName;
	UMDiameterTcpListenerStatus	_status;
	UMSocketError				_lastErr;

	BOOL						_listenerRunning;
	BOOL						_enableKeepalive;

	NSString *_privateKeyFile;
	NSData *_privateKeyFileData;

	NSString *_certFile;
	NSData *_certFileData;
}

@property(readwrite,assign,atomic)  in_port_t   port;
@property(readwrite,strong,atomic)  UMSocket    *listenerTcp;

@property(readwrite,assign,atomic)  BOOL        useTLS;
@property(readwrite,assign,atomic)  BOOL        enableKeepalive;
@property(readwrite,strong,atomic)  id          authorizeConnectionDelegate;
@property(readwrite,strong,atomic) NSString 	*listenerName;
@property(readwrite,assign,atomic)  UMDiameterTcpListenerStatus	status;
@property(readwrite,assign,atomic)  UMSocketError				lastErr;

- (id) initWithPort:(in_port_t)port
         socketType:(UMSocketType)type
                tls:(BOOL)doTLS
         sslKeyFile:(NSString *)sslKeyFile
        sslCertFile:(NSString *)sslCertFile
          taskQueue:(UMTaskQueue *)tq;


@end
