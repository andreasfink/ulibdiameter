//
//  UMDiameterPeerState_Wait_Conn_Ack.m
//  ulibdiameter
//
//  Created by Andreas Fink on 02.03.20.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState_Wait_Conn_Ack.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"

@implementation UMDiameterPeerState_Wait_Conn_Ack

- (NSString *)currentState
{
    return @"Wait-Conn-Ack";
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_CER:NULL];
    return [[UMDiameterPeerState_Wait_I_CEA alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack :(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionR_Accept:NULL];
    [peer actionProcess_CER:NULL];
    [peer actionR_Snd_CEA:NULL];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER  :(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionR_Accept:NULL];
    [peer actionProcess_CER:NULL];
    return [[UMDiameterPeerState_Wait_Conn_Ack_Elect alloc]init];
}

- (UMDiameterPeerState *)eventTimeout  :(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionError:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
