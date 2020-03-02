//
//  UMDiameterPeerState_R_Open.m
//  ulibdiameter
//
//  Created by Andreas Fink on 02.03.20.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//


/*
 state            event              action         next state
 -----------------------------------------------------------------
 R-Open           Send-Message     R-Snd-Message    R-Open
                  R-Rcv-Message    Process          R-Open
                  R-Rcv-DWR        Process-DWR,     R-Open
                                   R-Snd-DWA
                  R-Rcv-DWA        Process-DWA      R-Open
                  R-Conn-CER       R-Reject         R-Open
                  Stop             R-Snd-DPR        Closing
                  R-Rcv-DPR        R-Snd-DPA        Closing
                  R-Peer-Disc      R-Disc           Closed

 */
#import "UMDiameterPeerState_R_Open.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"

@implementation UMDiameterPeerState_R_Open

- (NSString *)currentState
{
    return @"R-Open";
}

- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer
{
    [peer actionR_Snd_Message];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_Message:(UMDiameterPeer *)peer
{
    [peer actionProcess];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DWR:(UMDiameterPeer *)peer
{
    [peer actionProcess_DWR];
    [peer actionR_Snd_DWA];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DWA:(UMDiameterPeer *)peer
{
    [peer actionProcess_DWA];
    return self;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer
{
    [peer actionR_Reject];
    return self;
}

- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer
{
    [peer actionR_Snd_DPR];
    return [[UMDiameterPeerState_Closing alloc]init];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DPR:(UMDiameterPeer *)peer
{
    [peer actionR_Snd_DPA];
    return [[UMDiameterPeerState_Closing alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer
{
    [peer actionR_Disc];
    return [[UMDiameterPeerState_Closed alloc]init];
}


@end
