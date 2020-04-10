//
//  UMDiameterPeerState_Closing.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//



/*
 state            event              action         next state
 -----------------------------------------------------------------
 Closing          I-Rcv-DPA        I-Disc           Closed
                  R-Rcv-DPA        R-Disc           Closed
                  Timeout          Error            Closed
                  I-Peer-Disc      I-Disc           Closed
                  R-Peer-Disc      R-Disc           Closed

 */
#import "UMDiameterPeerState_Closing.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"


@implementation UMDiameterPeerState_Closing

- (NSString *)currentState
{
    return @"Closing";
}

- (UMDiameterPeerState *)eventI_Rcv_DPA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionError:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
