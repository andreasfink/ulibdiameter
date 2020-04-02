//
//  UMDiameterPeerState_Closed.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState_all.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPacket.h"
#import "UMDiameterResultCode.h"

@implementation UMDiameterPeerState_Closed

- (NSString *)currentState
{
    return @"Closed";
}

- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_Conn_Req:NULL];
    UMDiameterPeerState *newState = [[UMDiameterPeerState_Wait_Conn_Ack alloc]init];
    return newState;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_CER:message];
    
    UMDiameterPacket *response = [peer createCEA:message.hopByHopIdentifier
                                        endToEnd:message.endToEndIdentifier
                                      resultCode:@(UMDiameterResultCode_DIAMETER_SUCCESS)
                                    errorMessage:NULL
                                       failedAvp:NULL];
    [peer actionR_Snd_CEA:response];
    return [[UMDiameterPeerState_R_Open alloc]init];
}


- (UMDiameterPeerState *)eventR_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_CER. Treating as eventR_Conn_CER",self.currentState];
        [peer logDebug:s];
    }
    return [self eventR_Conn_CER:peer message:message];
}

@end
