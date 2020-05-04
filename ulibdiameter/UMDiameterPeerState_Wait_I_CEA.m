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
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_CEA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionProcess_CEA:message];
    return [[UMDiameterPeerState_I_Open alloc]init];
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
    [peer actionProcess_CER:NULL];
    [peer actionElect:NULL];
    return [[UMDiameterPeerState_Wait_Returns alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer
                                  message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventI_Rcv_Non_CEA:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Non_CEA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionError:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
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
    return [[UMDiameterPeerState_Closed alloc]init];
}


@end
