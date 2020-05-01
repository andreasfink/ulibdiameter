//
//  UMDiameterPeerState_R_Open.m
//  ulibdiameter
//
//  Created by Andreas Fink on 02.03.20.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

/*
 state            event              action         next state
 -----------------------------------------------------------------
 R-Open           Send-Message     R-Snd-Message    R-Open
                  R-Rcv-Message    Process          R-Open
                  R-Rcv-DWR        Process-DWR,     R-Open
                                   R-Snd-DWA
                  R-Rcv-DWA        Process-DWA      R-Open
                  R-Conn-CER       R-Reject         R-Open
                  Stop             R-Snd-DPR        Closing
                  R-Rcv-DPR        R-Snd-DPA        Closing
                  R-Peer-Disc      R-Disc           Closed

 */
#import "UMDiameterPeerState_R_Open.h"
#import "UMDiameterPeerState_all.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPeer.h"
#import "UMDiameterResultCode.h"
#import "UMDiameterAvpDisconnect_Cause.h"
#import "UMDiameterAvpENUMS.h"

@implementation UMDiameterPeerState_R_Open

- (NSString *)currentState
{
    return @"R-Open";
}

- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionR_Snd_Message:message];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcessMessage:message];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_DWR:NULL];
    UMDiameterPacket *pkt = [peer createDWA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:@(UMDiameterResultCode_DIAMETER_SUCCESS)
                               errorMessage:NULL
                                  failedAvp:NULL];
    [peer actionR_Snd_DWA:pkt];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_DWA:NULL];
    return self;
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionR_Reject:NULL];
    return self;
}

- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    UMDiameterPacket *pkt = [peer createDPRwithDisconnectCause:@(UMDiameterAvpDisconnect_Cause_REBOOTING)];
    [peer actionR_Snd_DPR:pkt];
    return [[UMDiameterPeerState_Closing alloc]init];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    UMDiameterPacket *pkt = [peer createDPA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:NULL
                               errorMessage:NULL
                                  failedAvp:NULL];
    [peer actionR_Snd_DPA:pkt];
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionR_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventR_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    UMDiameterPacket *pkt = [peer createCEA:message.hopByHopIdentifier
                                   endToEnd:message.endToEndIdentifier
                                 resultCode:NULL
                               errorMessage:NULL
                                  failedAvp:NULL];
    [peer actionR_Snd_CEA:pkt];
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    [peer actionProcess_CEA:message];
    return self;
}

- (UMDiameterPeerState *)eventWatchdogTimer:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    UMDiameterPacket *pkt = [peer createDWR];
    [peer actionR_Snd_DWR:pkt];
    return self;
}

@end
