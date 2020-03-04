//
//  UMDiameterRouterTcpReceiver.m
//  ulibdiameter
//
//  Created by Andreas Fink on 03.03.2020.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouterTcpReceiver.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouter.h"

#include <poll.h>

@implementation UMDiameterRouterTcpReceiver

- (UMDiameterRouterTcpReceiver *)init
{
    NSAssert(0, @"use [UMDiameterRouterTcpReceiver initWithRouter:]");
    return NULL;
}

- (UMDiameterRouterTcpReceiver *)initWithRouter:(UMDiameterRouter *)r;
{
    self = [super initWithName:@"UMDiameterRouterTcpReceiver" workSleeper:NULL];
    if(self)
    {
        _router = r;
        _timeoutInMs = 250;
    }
    return self;
}

- (void)backgroundInit
{
    ulib_set_thread_name(@"UMDiameterRouterTcpReceiver");
}


- (void)backgroundExit
{
    ulib_set_thread_name(@"UMDiameterRouterTcpReceiver (terminating)");
}

- (void)backgroundTask
{
    BOOL mustQuit = NO;
    if(self.runningStatus != UMBackgrounder_startingUp)
    {
        return;
    }
    if(self.workSleeper==NULL)
    {
        self.workSleeper = [[UMSleeper alloc]initFromFile:__FILE__ line:__LINE__ function:__func__];
        [self.workSleeper prepare];
    }
    self.runningStatus = UMBackgrounder_running;
    [self.control_sleeper wakeUp:UMSleeper_StartupCompletedSignal];
    
    [self backgroundInit];

    while((UMBackgrounder_running == self.runningStatus) && (mustQuit==NO))
    {
        [self waitAndHandleData];
    }
    [self backgroundExit];
    self.runningStatus = UMBackgrounder_notRunning;
    self.workSleeper = NULL;
    [self.control_sleeper wakeUp:UMSleeper_ShutdownCompletedSignal];
}



- (UMSocketError) waitAndHandleData
{
    UMSocketError returnValue = UMSocketError_generic_error;

    NSArray *allListenerKeys = [_router.tcpListeners allKeys];
    NSMutableArray *pinfo = [[NSMutableArray alloc]init];
    for(NSString *key in allListenerKeys)
    {
        UMSocket *s = _router.tcpListeners[key];
        if(s)
        {
            [pinfo addObject:s];
        }
    }
    
    NSUInteger listeners_count = pinfo.count;
    if(listeners_count)
    {
        sleep(1);
        return UMSocketError_no_data;
    }

    struct pollfd *pollfds = calloc(listeners_count+1,sizeof(struct pollfd));
    NSAssert(pollfds !=0,@"can not allocate memory for poll()");
    memset(pollfds, 0x00,listeners_count+1  * sizeof(struct pollfd));
    int events = POLLIN | POLLPRI | POLLERR | POLLHUP | POLLNVAL;
#ifdef POLLRDBAND
    events |= POLLRDBAND;
#endif
    
#ifdef POLLRDHUP
    events |= POLLRDHUP;
#endif
    nfds_t j=0;

    for(NSUInteger i=0;i<listeners_count;i++)
    {
        UMSocket *listener = pinfo[i];
        pollfds[j].fd = listener.fileDescriptor;
        pollfds[j].events = events;
        j++;
    }
    /* we could add a wakeup pipe here if we want. thats why the size of pollfds is +1 */
    int ret1 = poll(pollfds, j, _timeoutInMs);
    UMMicroSec poll_time = ulib_microsecondTime();
    if (ret1 < 0)
    {
        int eno = errno;
        if((eno==EINPROGRESS) || (eno == EINTR) || (eno==EAGAIN))
        {
            returnValue = UMSocketError_no_data;
        }
        else
        {
            returnValue = [UMSocket umerrFromErrno:eno];
        }
    }
    else if (ret1 == 0)
    {
        returnValue = UMSocketError_no_data;
    }
    else /* ret1 > 0 */
    {
        /* we have some event to handle. */
        returnValue = UMSocketError_no_error;

        UMSocket *socket = NULL;
        for(NSUInteger i=0;i<listeners_count;i++)
        {
            socket = pinfo[i];
            int revent = pollfds[j].revents;
            UMSocketError r = [_router handlePollResult:revent
                                                 socket:socket
                                              poll_time:poll_time];
            if(r != UMSocketError_no_error)
            {
                returnValue= r;
            }
        }
    }
    switch(returnValue)
    {
        case UMSocketError_has_data_and_hup:
        case UMSocketError_has_data:
        case UMSocketError_no_error:
        case UMSocketError_no_data:
        case UMSocketError_timed_out:
            break;
        default:
            /* if poll returns an error, we will not have hit the timeout. Hence we risk a busy loop */
            usleep(100000); /* sleep 0.1 sec */
            break;
    }

    if(pollfds)
    {
        free(pollfds);
        pollfds=NULL;
    }
    return returnValue;
}

@end
