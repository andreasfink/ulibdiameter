//
//  UMDiameterPeerState_Closed.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState_all.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_Connected.h"

@implementation UMDiameterPeerState_Closed

- (NSString *)currentState
{
    return @"Closed";
}

- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer
{
    [super eventSctpForcedOutOfService:peer];
    return [[UMDiameterPeerState_forced_out_of_service alloc]init];
}

- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer
{
    [super eventSctpOff:peer];
    return self;
}

- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer
{
    [super eventSctpOutOfService:peer];
    return self;
}

- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer
{
    [peer sendCER];
    return [[UMDiameterPeerState_Connected alloc]init];
}

@end
