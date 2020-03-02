
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

- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_Message:message];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcessMessage:message];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_DWR:message];
    [peer actionI_Snd_DWA:NULL];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_DWA:NULL];
    return self;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionR_Reject:NULL];
    return self;
}

- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_DPR:NULL];
    return [[UMDiameterPeerState_Closing alloc]init];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_DPA:NULL];
    return [[UMDiameterPeerState_Closing alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
