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

- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer
{
    [peer actionI_Snd_CER];
    return [[UMDiameterPeerState_Wait_I_CEA alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack :(UMDiameterPeer *)peer
{
    [peer actionR_Accept];
    [peer actionProcess_CER];
    [peer actionR_Snd_CEA];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER  :(UMDiameterPeer *)peer
{
    [peer actionR_Accept];
    [peer actionProcess_CER];
    return [[UMDiameterPeerState_Wait_Conn_Ack_Elect alloc]init];
}

- (UMDiameterPeerState *)eventTimeout  :(UMDiameterPeer *)peer
{
    [peer actionError];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
