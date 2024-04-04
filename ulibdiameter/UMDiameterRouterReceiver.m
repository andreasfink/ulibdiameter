//
//  UMDiameterRouterReceiver.m
//  ulibdiameter
//
//  Created by Andreas Fink on 03.03.2020.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterRouterReceiver.h>
#import <ulibdiameter/UMDiameterPeer.h>
#import <ulibdiameter/UMDiameterRouter.h>

#include <poll.h>

@implementation UMDiameterRouterReceiver

- (UMDiameterRouterReceiver *)init
{
    NSAssert(0, @"use [UMDiameterRouterReceiver initWithRouter:]");
    return NULL;
}

- (UMDiameterRouterReceiver *)initWithRouter:(UMDiameterRouter *)r;
{
    self = [super initWithName:@"UMDiameterRouterReceiver" workSleeper:NULL];
    if(self)
    {
        _router = r;
        _timeoutInMs = 1000;
    }
    return self;
}

- (void)backgroundInit
{
    ulib_set_thread_name(@"UMDiameterRouterReceiver");
}

- (void)backgroundExit
{
    ulib_set_thread_name(@"UMDiameterRouterReceiver (terminating)");
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

    NSArray *allListeners = [_router getListeners];
    NSArray *allReceivers = [_router getReceivignSockets];
    NSMutableArray *pinfo = [[NSMutableArray alloc]init];
    for(UMSocket *s in allListeners)
    {
        if(s)
        {
            [pinfo addObject:@[@(YES),s]];
        }
    }

     for(UMSocket *s in allReceivers)
     {
         if(s)
         {
             [pinfo addObject:@[@(NO),s]];
         }
     }

    NSUInteger sockets_count = pinfo.count;
    if(sockets_count==0)
    {
        sleep(1);
        return UMSocketError_no_data;
    }

    struct pollfd *pollfds = calloc(sockets_count+1,sizeof(struct pollfd));
    NSAssert(pollfds !=0,@"can not allocate memory for poll()");
    memset(pollfds, 0x00,sockets_count+1  * sizeof(struct pollfd));
    int events = POLLIN | POLLPRI | POLLERR | POLLHUP | POLLNVAL;

    //nfds_t j=0;

    for(NSUInteger i=0;i<sockets_count;i++)
    {
        NSArray *a = pinfo[i];
        UMSocket *socket = a[1];
        pollfds[i].fd = socket.fileDescriptor;
        pollfds[i].events = events;
        //j++;
    }
    /* we could add a wakeup pipe here if we want. thats why the size of pollfds is +1 */

    int ret1 = poll(pollfds, (nfds_t)sockets_count, _timeoutInMs);
    UMMicroSec poll_time = ulib_microsecondTime();
    if (ret1 < 0)
    {
        int eno = errno;
        if((eno==EINPROGRESS) || (eno == EINTR) || (eno==EAGAIN)  || (eno==EBUSY))
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

        for(NSUInteger i=0;i<sockets_count;i++)
        {
            NSArray *a = pinfo[i];
            BOOL isListener = [a[0] boolValue];
            UMSocket *socket = a[1];
            int revent = pollfds[i].revents;
            if(revent!=0)
            {
                 UMSocketError r = [_router handlePollResult:revent
                                                     socket:socket
                                                  poll_time:poll_time
                                                 isListener:isListener];
                if(r != UMSocketError_no_error)
                {
                    returnValue= r;
                }
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
