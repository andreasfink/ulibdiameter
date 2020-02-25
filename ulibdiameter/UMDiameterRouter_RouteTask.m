//
//  UMDiameterRouter_RouteTask.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouter_RouteTask.h"
#import "UMDiameterRouter.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouterSession.h"

@implementation UMDiameterRouter_RouteTask


- (UMDiameterRouter_RouteTask *)initWithRouter:(UMDiameterRouter *)router
                                        sender:(UMDiameterPeer *)sender
                                        packet:(UMDiameterPacket *)packet
{
    self = [super initWithName:[[self class]description]
                      receiver:router
                        sender:sender
       requiresSynchronisation:NO];
    if(self)
    {
        _packet = packet;
        _sender = sender;
        _router = router;
    }
    return self;
}



- (void)main
{
    UMDiameterRouterSession *session = [_router findSessionForPacket:_packet];
    if(session)
    {
        /* if we have a session, we use the same route back */
        [session touch];
    }
}

@end
