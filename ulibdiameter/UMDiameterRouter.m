//
//  UMDiameterRouter.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouter.h"
#import "UMDiameterRouter_RouteTask.h"
#import "UMDiameterRouterSession.h"
#import "UMDiameterPacket.h"

@implementation UMDiameterRouter

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    return [self initWithTaskQueueMulti:tq name:@""];
}

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name
{
    self = [super initWithTaskQueueMulti:tq name:name];
    if(self)
    {
        _sessions = [[UMSynchronizedDictionary alloc]init];
        _defaultSessionTimeout = 90;
        _inboundThroughputPackets   = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _outboundThroughputPackets  = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _housekeepingTimer = [[UMTimer alloc]initWithTarget:self selector:@selector(housekeeping) object:NULL seconds:30 name:@"housekeeping-timer" repeats:YES];
        _housekeepingLock = [[UMMutex alloc]initWithName:@"housekeeping-timer-lock"];

    }
    return self;
}

- (void)housekeeping
{
    if([_housekeepingLock tryLock]==0)
    {
        /* */
        NSArray *arr = [_sessions allKeys];
        for(NSString *sid in arr)
        {
            UMDiameterRouterSession *session = [self findSessionById:sid];
            if([session isExpired])
            {

            }
        }
        [_housekeepingLock unlock];

    }
}

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer
{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt];
    [self queueFromLower:task];
}

- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer
{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt];
    [self queueFromLowerWithPriority:task];
}


- (UMDiameterRouterSession *)findSessionById:(NSString *)sid
{
    return _sessions[sid];
}

- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt
{
    NSString *sid = [pkt getSessionIdentifier];
    if(sid)
    {
        return _sessions[sid];
    }
    return NULL;
}

@end
