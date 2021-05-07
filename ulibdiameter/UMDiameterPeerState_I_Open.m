
//
//  UMDiameterPeerState_I_Open.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//



/*
 state            event              action         next state
 -----------------------------------------------------------------
 I-Open           Send-Message     I-Snd-Message    I-Open
                  I-Rcv-Message    Process          I-Open
                  I-Rcv-DWR        Process-DWR,     I-Open
                                   I-Snd-DWA
                  I-Rcv-DWA        Process-DWA      I-Open
                  R-Conn-CER       R-Reject         I-Open
                  Stop             I-Snd-DPR        Closing
                  I-Rcv-DPR        I-Snd-DPA        Closing
                  I-Peer-Disc      I-Disc           Closed

 */
#import "UMDiameterPeerState_I_Open.h"
#import "UMDiameterPeerState_all.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPeer.h"
#import "UMDiameterAvpDisconnect_Cause.h"
#import "UMDiameterAvpENUMS.h"
#import "UMDiameterResultCode.h"

@implementation UMDiameterPeerState_I_Open

- (NSString *)currentState
{
    return @"I-Open";
}

- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer
                                   message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventSend_Message:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Snd_Message:message];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_Message:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_Message:\n%@",self.currentState,message];
        [peer logDebug:s];
    }

    [peer actionProcessMessage:message];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWR:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_DWR:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionProcess_DWR:message];
    UMDiameterPacket *pkt = [peer createDWA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:@(UMDiameterResultCode_DIAMETER_SUCCESS)
                               errorMessage:NULL
                                  failedAvp:NULL];
    [peer actionI_Snd_DWA:pkt];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_DWA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionProcess_DWA:NULL];
    return self;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventR_Conn_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionR_Reject:NULL];
    return self;
}

- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventStop:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    UMDiameterPacket *pkt = [peer createDPRwithDisconnectCause:@(UMDiameterAvpDisconnect_Cause_REBOOTING)];
    [peer actionI_Snd_DPR:pkt];
    return [[UMDiameterPeerState_Closing alloc]init];
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_DPR:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    UMDiameterPacket *pkt = [peer createDPA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:NULL
                               errorMessage:NULL
                                  failedAvp:NULL];
    [peer actionI_Snd_DPA:pkt];
    return [[UMDiameterPeerState_Closing alloc]init];
}

- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Peer_Disc:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}


- (UMDiameterPeerState *)eventI_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_CER:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionProcess_CER:message];
    UMDiameterPacket *pkt = [peer createCEA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:NULL
                               errorMessage:NULL
                                  failedAvp:peer.failedVendorSpecificIds];
    [peer actionI_Snd_CEA:pkt];
    if((peer.sendReverseCER) && (peer.reverseCERSent == NO))
    {
        message = [peer createCER];
        [peer actionI_Snd_CER:message];
        peer.reverseCERSent = YES;
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventI_Rcv_CEA:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    [peer actionProcess_CEA:message];
    if(peer.sendCUR)
    {
        [peer actionI_Snd_CUR:NULL];
    }
    return self;
}


- (UMDiameterPeerState *)eventWatchdogTimer:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"%@: eventWatchdogTimer:\n%@",self.currentState,message];
        [peer logDebug:s];
    }
    UMDiameterPacket *pkt = [peer createDWR];
    [peer actionI_Snd_DWR:pkt];
    return self;
}

@end
