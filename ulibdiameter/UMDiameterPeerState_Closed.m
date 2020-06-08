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
#import "UMDiameterRouter.h"

@implementation UMDiameterPeerState_Closed

- (NSString *)currentState
{
    return @"Closed";
}

- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventStart:\n%@",self.currentState,message];
        [peer logDebug:s];
    }

    peer.supportedVendorIds = peer.router.supportedVendorIds;
    peer.authApplicationIds = [peer.router.authApplicationIds mutableCopy];
    peer.acctApplicationIds = [peer.router.acctApplicationIds mutableCopy];
    peer.vendorSpecificIds = [peer.router.vendorSpecificIds mutableCopy];

    UMSocketError err =[peer actionI_Snd_Conn_Req:NULL];
    
    UMDiameterPeerState *newState = self;

    if(err==UMSocketError_in_progress)
    {
        newState = [[UMDiameterPeerState_Wait_Conn_Ack alloc]init];
    }
    else if(err == UMSocketError_no_error)
    {
        newState = [[UMDiameterPeerState_Wait_Conn_Ack alloc]init];
        newState = [newState eventI_Rcv_Conn_Ack:peer message:NULL];
    }
    return newState;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Conn_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }

    [peer actionProcess_CER:message];
    
    UMDiameterPacket *response = [peer createCEA:message.hopByHopIdentifier
                                        endToEnd:message.endToEndIdentifier
                                      resultCode:@(UMDiameterResultCode_DIAMETER_SUCCESS)
                                    errorMessage:NULL
                                       failedAvp:NULL];
    [peer actionR_Snd_CEA:response];
    return [[UMDiameterPeerState_R_Open alloc]init];
}

- (UMDiameterPeerState *)eventR_Rcv_Conn_Ack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Rcv_Conn_Ack:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    return self;
}


- (UMDiameterPeerState *)eventR_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Rcv_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    return [self eventR_Conn_CER:peer message:message];
}

@end
