//
//  UMDiameterPeerState_Closed.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState_all.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_Connected.h"
#import "UMDiameterPacket.h"
#import "UMDiameterResultCode.h"

@implementation UMDiameterPeerState_Closed

- (NSString *)currentState
{
    return @"Closed";
}
/* ############# */
- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionI_Snd_Conn_Req:NULL];
    return [[UMDiameterPeerState_Wait_Conn_Ack alloc]init];
}

- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer actionR_Accept:message];
    [peer actionProcess_CER:message];
    
    UMDiameterPacket *response = [peer createCEA:message.hopByHopIdentifier
                                        endToEnd:message.endToEndIdentifier
                                      resultCode:@(UMDiameterResultCode_DIAMETER_SUCCESS)
                                    errorMessage:NULL
                                       failedAvp:NULL];
    [peer actionR_Snd_CEA:response];
    
    return [[UMDiameterPeerState_R_Open alloc]init];
}

/* #############

- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [super eventSctpForcedOutOfService:peer];
    return [[UMDiameterPeerState_forced_out_of_service alloc]init];
}

- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [super eventSctpOff:peer];
    return self;
}

- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [super eventSctpOutOfService:peer];
    return self;
}



- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer  message:(UMDiameterPacket *)message
{
    [peer sendCER];
    return [[UMDiameterPeerState_Connected alloc]init];
}

  */
@end
