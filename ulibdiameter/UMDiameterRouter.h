//
//  UMDiameterRouter.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "UMDiameterMessage.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouterSession.h"

@interface UMDiameterRouter : UMLayer
{
    UMSynchronizedDictionary *_sessions;
    UMThroughputCounter *_inboundThroughputPackets;
    UMThroughputCounter *_outboundThroughputPackets;
    NSTimeInterval      _defaultSessionTimeout;
    UMTimer *_housekeepingTimer;
    UMMutex *_housekeepingLock;

}

- (authorizeIncomingDiameterConnection:

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name;

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt           source:(UMDiameterPeer *)peer;
- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer;

- (UMDiameterRouterSession *)findSessionById:(NSString *)sid;
- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt;

@end
