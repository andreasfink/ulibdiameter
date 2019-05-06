//
//  UMDiameterPeerState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState.h"
#import "UMDiameterPeer.h"

@implementation UMDiameterPeerState


- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting  = NO;
    peer.isForcedOutOfService = YES;
    return self;
}
- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting = NO;
    peer.isForcedOutOfService = NO;
    return self;
}

- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting = YES;
    peer.isForcedOutOfService = NO;
    return self;
}

- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer
{
    peer.isConnected = YES;
    peer.isConnecting = NO;
    peer.isForcedOutOfService = NO;
    return self;
}


- (UMDiameterPeerState *)eventAuthenticationPassed:(UMDiameterPeer *)peer
{
    if(peer.isConnected)
    {
        peer.isActive = YES;
    }
    return self;
}

@end
