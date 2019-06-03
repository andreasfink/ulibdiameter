//
//  UMDiameterLocalUserProtocol.h
//  ulibdiameter
//
//  Created by Andreas Fink on 03.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
@class UMDiameterPacket;
@class UMDiameterRouter;
@class UMDiameterPeer;

@protocol UMDiameterLocalUserProtocol<NSObject>

- (void)processIncomingRequestPacket:(UMDiameterPacket *)packet
                              router:(UMDiameterRouter *)router
                                peer:(UMDiameterPeer *)peer;

- (void)processIncomingErrorPacket:(UMDiameterPacket *)packet
                            router:(UMDiameterRouter *)router
                              peer:(UMDiameterPeer *)peer;

- (void)processIncomingResponsePacket:(UMDiameterPacket *)packet
                               router:(UMDiameterRouter *)router
                                 peer:(UMDiameterPeer *)peer;
@end

