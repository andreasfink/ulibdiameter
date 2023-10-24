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
#import <ulibdiameter/UMDiameterPeerState_Wait_Returns.h>
#import <ulibdiameter/UMDiameterPeer.h>
#import <ulibdiameter/UMDiameterPeerState_all.h>
@implementation UMDiameterPeerState_Wait_Returns


- (NSString *)currentState
{
    return @"Wait-Returns";
}

- (UMDiameterPeerState *)eventWin_Election:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventWin_Election:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    [peer actionR_Snd_CEA:NULL];
    if((peer.sendReverseCER) && (peer.reverseCERSent == NO))
    {
        message = [peer createCER];
        [peer actionR_Snd_CER:message];
        peer.reverseCERSent = YES;
    }
    return [[UMDiameterPeerState_R_Open alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    [peer actionR_Snd_CEA:NULL];
    if((peer.sendReverseCER) && (peer.reverseCERSent == NO))
    {
        message = [peer createCER];
        [peer actionR_Snd_CER:message];
        peer.reverseCERSent = YES;
    }
    return [[UMDiameterPeerState_R_Open alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventI_Rcv_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_CEA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_I_Open alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_Wait_I_CEA alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Conn_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Reject:NULL];
    return [[UMDiameterPeerState_Wait_Returns alloc]initWithPeer:peer];
}


- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
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
