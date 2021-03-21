//
//  UMDiameterPeerState.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;
@class UMDiameterPacket;

@interface UMDiameterPeerState : UMObject
- (NSString *)currentState;

/*  eventStart: The Diameter application has signaled that a connection should be initiated with the peer. */
- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/*  R-Conn-CER An acknowledgement is received stating that the transport connection has been established, and the associated CER has arrived. */
- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-Conn-Ack   A positive acknowledgement is received confirming that the transport connection is established outbound. */
- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_Conn_Ack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/*  Rcv-Conn-Nack  A negative acknowledgement was received stating that the transport connection was not established. */
- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_Conn_Nack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/*  Timeout:An application-defined timer has expired while waiting for some event.*/
- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-CER: A CER message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-CEA: A CEA message from the peer was received.  */
- (UMDiameterPeerState *)eventI_Rcv_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;


/* Peer-Disc: A disconnection indication from the peer was received. */
- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-DPR: A DPR message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-DPA:A DPA message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_DPA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_DPA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;


/* Rcv-DWR: A DWR message from the peer was received. */
- (UMDiameterPeerState *)eventR_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventI_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-DWA:A DWA message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;


/* Win-Election: An election was held, and the local node was the winner. */
- (UMDiameterPeerState *)eventWin_Election:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;;

/* Send-Message:A message is to be sent. */
- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-Message:A message other than CER, CEA, DPR, DPA, DWR, or DWA was received. */
- (UMDiameterPeerState *)eventI_Rcv_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

/* Rcv-Non-CEA: A message, other than a CEA, from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_Non_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
- (UMDiameterPeerState *)eventR_Rcv_Non_CEA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;


/* Stop: The Diameter application has signaled that a connection should be terminated (e.g., on system shutdown). */
- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;

- (UMDiameterPeerState *)eventWatchdogTimer:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message;
@end

