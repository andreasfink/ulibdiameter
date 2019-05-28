//
//  UMDiameterPeerState_Connecting.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState_Connecting.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_Connected.h"

@implementation UMDiameterPeerState_Connecting

- (NSString *)currentState
{
    return @"Connecting";
}


- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer
{
    peer.isConnected = YES;
    peer.isConnecting = NO;
    peer.isForcedOutOfService = NO;
    [peer sendCER];
    return [[UMDiameterPeerState_Connected alloc]init];
}

@end
