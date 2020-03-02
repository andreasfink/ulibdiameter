
//
//  UMDiameterPeerState_I_Open.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//



/*
 state            event              action         next state
 -----------------------------------------------------------------
 I-Open           Send-Message     I-Snd-Message    I-Open
                  I-Rcv-Message    Process          I-Open
                  I-Rcv-DWR        Process-DWR,     I-Open
                                   I-Snd-DWA
                  I-Rcv-DWA        Process-DWA      I-Open
                  R-Conn-CER       R-Reject         I-Open
                  Stop             I-Snd-DPR        Closing
                  I-Rcv-DPR        I-Snd-DPA        Closing
                  I-Peer-Disc      I-Disc           Closed

 */
#import "UMDiameterPeerState_I_Open.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"

@implementation UMDiameterPeerState_I_Open

- (NSString *)currentState
{
    return @"I-Open";
}

- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer
{
    [peer actionI_Snd_Message];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_Message:(UMDiameterPeer *)peer
{
    [peer actionProcess];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWR:(UMDiameterPeer *)peer
{
    [peer actionProcess_DWR];
    [peer actionI_Snd_DWA];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWA:(UMDiameterPeer *)peer
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
    [peer actionI_Snd_DPR];
    return [[UMDiameterPeerState_Closing alloc]init];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DPR:(UMDiameterPeer *)peer
{
    [peer actionI_Snd_DPA];
    return [[UMDiameterPeerState_Closing alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer
{
    [peer actionI_Disc];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
