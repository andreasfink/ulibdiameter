//
//  UMDiameterPeerState.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;

@interface UMDiameterPeerState : UMObject
- (NSString *)currentState;

- (UMDiameterPeerState *)eventSctpForcedOutOfService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpOff:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpOutOfService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSctpInService:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventAuthenticationPassed:(UMDiameterPeer *)peer;


- (UMDiameterPeerState *)eventRConnCER:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvConnNack:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvConnAck:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvNonCEA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIPeerDisc:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRPeerDisc:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventWinElection:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventSendMessage:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvMessage:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvMessage:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvDWR:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvDWR:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvDWA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvDWA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvDPR:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvDPA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvDPR:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvDPA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvCER:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvCER:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventRRcvCEA:(UMDiameterPeer *)peer;
- (UMDiameterPeerState *)eventIRcvCEA:(UMDiameterPeer *)peer;

@end

