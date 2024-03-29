//
//  UMDiameterPeerState_Wait_Conn_Ack.m
//  ulibdiameter
//
//  Created by Andreas Fink on 02.03.20.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterPeerState_Wait_Conn_Ack.h>
#import <ulibdiameter/UMDiameterPeer.h>
#import <ulibdiameter/UMDiameterPeerState_all.h>

@implementation UMDiameterPeerState_Wait_Conn_Ack

- (NSString *)currentState
{
    return @"Wait-Conn-Ack";
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer
                                     message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Conn_Ack:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Snd_CER:NULL];
    return [[UMDiameterPeerState_Wait_I_CEA alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack:(UMDiameterPeer *)peer
                                      message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Conn_Nack:\n%@",self.currentState,message];
        [peer logDebug:s];
    }

    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer
                                 message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Conn_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }

    [peer actionR_Accept:NULL];
    [peer actionProcess_CER:message];
    return [[UMDiameterPeerState_Wait_Conn_Ack_Elect alloc]initWithPeer:peer];
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
                              message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventTimeout:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    return [[UMDiameterPeerState_Closed alloc]initWithPeer:peer];
}

@end
