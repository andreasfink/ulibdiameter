//
//  UMDiameterPeerState_Closed.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterPeerState_all.h>
#import <ulibdiameter/UMDiameterPeer.h>
#import <ulibdiameter/UMDiameterPacket.h>
#import <ulibdiameter/UMDiameterResultCode.h>
#import <ulibdiameter/UMDiameterRouter.h>

@implementation UMDiameterPeerState_Closed

- (UMDiameterPeerState *) initWithPeer:(UMDiameterPeer *)peer
{
    self = [super initWithPeer:peer];
    if(self)
    {
        /* in case they are not yet closed */
        [_peer.initiator_socket close];
        [_peer.responder_socket close];
        [_peer actionCleanup:NULL];
        [_peer startReopenTimer1];
    }
    return self;
}

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

    peer.reverseCERSent = NO;
    peer.supportedVendorIds = peer.router.supportedVendorIds;
    peer.authApplicationIds = [peer.router.authApplicationIds mutableCopy];
    peer.acctApplicationIds = [peer.router.acctApplicationIds mutableCopy];
    peer.vendorSpecificIds = [peer.router.vendorSpecificIds mutableCopy];

    UMSocketError err =[peer actionI_Snd_Conn_Req:NULL];
    
    UMDiameterPeerState *newState = self;

    if(err==UMSocketError_in_progress)
    {
        newState = [[UMDiameterPeerState_Wait_Conn_Ack alloc]initWithPeer:peer];
    }
    else if(err == UMSocketError_no_error)
    {
        newState = [[UMDiameterPeerState_Wait_Conn_Ack alloc]initWithPeer:peer];
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
                                       failedAvp:peer.failedVendorSpecificIds];
    [peer actionR_Snd_CEA:response];
    if((peer.sendReverseCER) && (peer.reverseCERSent == NO))
    {
        message = [peer createCER];
        [peer actionR_Snd_CER:message];
        peer.reverseCERSent = YES;
    }
    return [[UMDiameterPeerState_R_Open alloc]initWithPeer:peer];
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
