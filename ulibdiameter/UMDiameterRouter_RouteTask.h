//
//  UMDiameterRouter_RouteTask.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPacket;
@class UMDiameterPeer;
@class UMDiameterRouter;

@interface UMDiameterRouter_RouteTask : UMLayerTask
{
    UMDiameterPacket *_packet;
    UMDiameterPeer   *_sender;
    UMDiameterRouter *_router;
}

@property(readwrite,strong,atomic)  UMDiameterPacket *packet;

- (UMDiameterRouter_RouteTask *)initWithRouter:(UMDiameterRouter *)router
                                        sender:(UMDiameterPeer *)sender
                                        packet:(UMDiameterPacket *)packet;

- (void)main;

@end


