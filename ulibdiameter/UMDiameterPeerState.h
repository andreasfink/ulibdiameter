//
//  UMDiameterPeerState.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;

@interface UMDiameterPeerState : UMObject


- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventAuthenticationPassed:(UMDiameterPeer *)peer;

@end

