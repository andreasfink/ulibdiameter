//
//  UMDiameterPeerState_Wait_Conn_Ack_Elect.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

/*
 state            event              action         next state
 -----------------------------------------------------------------
 Wait-Conn-Ack/   I-Rcv-Conn-Ack   I-Snd-CER,Elect  Wait-Returns
 Elect            I-Rcv-Conn-Nack  R-Snd-CEA        R-Open
                  R-Peer-Disc      R-Disc           Wait-Conn-Ack
                  R-Conn-CER       R-Reject         Wait-Conn-Ack/
                                                    Elect
                  Timeout          Error            Closed
 */
#import "UMDiameterPeerState_Wait_Conn_Ack_Elect.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_all.h"

@implementation UMDiameterPeerState_Wait_Conn_Ack_Elect


- (NSString *)currentState
{
    return @"Wait-Conn-Ack-Elect";
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Conn_Ack:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Snd_CER:NULL];
    [peer actionElect:NULL];
    return [[UMDiameterPeerState_Wait_Returns alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Conn_Nack:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Snd_CEA:NULL];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_Wait_Conn_Ack alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Conn_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Reject:NULL];
    return [[UMDiameterPeerState_Wait_Conn_Ack_Elect alloc]init];
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventTimeout:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionError:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}


@end
