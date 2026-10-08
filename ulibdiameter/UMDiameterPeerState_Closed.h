//
//  UMDiameterPeerState_Closed.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterPeerState.h>


@interface UMDiameterPeerState_Closed : UMDiameterPeerState

- (UMDiameterPeerState *) initWithPeer:(UMDiameterPeer *)peer;

@end

