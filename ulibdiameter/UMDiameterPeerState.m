//
//  UMDiameterPeerState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPeerState_Closed.h"      /* SCTP is down */
#import "UMDiameterPeerState_Connecting.h"  /* connection requested but not acked yet */
#import "UMDiameterPeerState_Connected.h"   /* SCTP connection established but no CER/CEA handshake yet */
#import "UMDiameterPeerState_Open.h"        /* SCTP up, CER/CEA handshake completed. Ready for Service */

@implementation UMDiameterPeerState

- (NSString *)currentState
{
    return @"undefined";
}

- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting  = NO;
    peer.isForcedOutOfService = YES;
    return [[UMDiameterPeerState_Closed alloc]init];
}
- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting = NO;
    peer.isForcedOutOfService = NO;
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer
{
    peer.isConnected = NO;
    peer.isActive  = NO;
    peer.isConnecting = YES;
    peer.isForcedOutOfService = NO;
    return [[UMDiameterPeerState_Connecting alloc]init];
}

- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer
{
    peer.isConnected = YES;
    peer.isConnecting = NO;
    peer.isForcedOutOfService = NO;
    return [[UMDiameterPeerState_Connected alloc]init];
}


- (UMDiameterPeerState *)eventAuthenticationPassed:(UMDiameterPeer *)peer
{
    if(peer.isConnected)
    {
        peer.isActive = YES;
    }
    return self;
}



- (UMDiameterPeerState *)eventRConnCER:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvConnNack:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvConnAck:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvNonCEA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIPeerDisc:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRPeerDisc:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventWinElection:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventSendMessage:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvMessage:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvMessage:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvDWR:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvDWR:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvDWA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvDWA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvDPR:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvDPA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvDPR:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvDPA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvCER:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvCER:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventRRcvCEA:(UMDiameterPeer *)peer
{
    return self;
}

- (UMDiameterPeerState *)eventIRcvCEA:(UMDiameterPeer *)peer
{
    return self;
}

@end
