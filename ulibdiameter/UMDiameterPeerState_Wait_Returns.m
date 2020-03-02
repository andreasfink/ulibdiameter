//
//  UMDiameterPeerState_Wait_Returns.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


/*
 state            event              action         next state
 -----------------------------------------------------------------
 Wait-Returns     Win-Election     I-Disc,R-Snd-CEA R-Open
                  I-Peer-Disc      I-Disc,          R-Open
                                   R-Snd-CEA
                  I-Rcv-CEA        R-Disc           I-Open
                  R-Peer-Disc      R-Disc           Wait-I-CEA
                  R-Conn-CER       R-Reject         Wait-Returns
                  Timeout          Error            Closed

 */
#import "UMDiameterPeerState_Wait_Returns.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"
@implementation UMDiameterPeerState_Wait_Returns


- (NSString *)currentState
{
    return @"Wait-Returns";
}

- (UMDiameterPeerState *)eventWin_Election:(UMDiameterPeer *)peer
{
    [peer actionI_Disc:NULL];
    [peer actionR_Snd_CEA];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc  :(UMDiameterPeer *)peer
{
    [peer actionI_Disc];
    [peer actionR_Snd_CEA];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_CEA  :(UMDiameterPeer *)peer
{
    [peer actionR_Disc];
    return [[UMDiameterPeerState_I_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc :(UMDiameterPeer *)peer
{
    [peer actionR_Disc];
    return [[UMDiameterPeerState_Wait_I_CEA alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER :(UMDiameterPeer *)peer
{
    [peer actionR_Reject];
    return [[UMDiameterPeerState_Wait_Returns alloc]init];
}


- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
{
    [peer actionError];
    return [[UMDiameterPeerState_Closed alloc]init];
}

@end
