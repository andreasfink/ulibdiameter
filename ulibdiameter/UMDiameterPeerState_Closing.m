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
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_DPA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Disc:NULL];
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
                              message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventTimeout:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionError:NULL];
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

@end
