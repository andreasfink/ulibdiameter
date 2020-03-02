//
//  UMDiameterPeerState_Wait_I_CEA.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//
/*
state            event              action         next state
-----------------------------------------------------------------

Wait-I-CEA       I-Rcv-CEA        Process-CEA      I-Open
                 R-Conn-CER       R-Accept,        Wait-Returns
                                  Process-CER,
                                  Elect
                 I-Peer-Disc      I-Disc           Closed
                 I-Rcv-Non-CEA    Error            Closed
                 Timeout          Error            Closed
*/

#import "UMDiameterPeerState_Wait_I_CEA.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"

@implementation UMDiameterPeerState_Wait_I_CEA


- (NSString *)currentState
{
    return @"Wait-I-CEA";
}

- (UMDiameterPeerState *)eventI_Rcv_CEA:(UMDiameterPeer *)peer
{
    [peer actionProcess_CEA];
    return [[UMDiameterPeerState_I_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER  :(UMDiameterPeer *)peer
{
    [peer actionR_Accept];
    [peer actionProcess_CER];
    [peer actionElect];
    return [[UMDiameterPeerState_Wait_Returns alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc  :(UMDiameterPeer *)peer
{
    [peer actionI_Disc];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_Non_CEA  :(UMDiameterPeer *)peer
{
    [peer actionError];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
{
    [peer actionError];
    return [[UMDiameterPeerState_Closed alloc]init];
}


@end
