//
//  UMDiameterPeerState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeerState.h"
#import "UMDiameterPeerState_all.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouter.h"

@implementation UMDiameterPeerState

- (NSString *)currentState
{
    return @"undefined";
}


/*  eventStart: The Diameter application has signaled that a connection should be initiated with the peer. */
- (UMDiameterPeerState *)eventStart:(UMDiameterPeer *)peer
                            message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventStart",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

/*  R-Conn-CER An acknowledgement is received stating that the transport connection has been established, and the associated CER has arrived. */
- (UMDiameterPeerState *)eventR_Conn_CER:(UMDiameterPeer *)peer
                                 message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Conn_CER",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-Conn-Ack   A positive acknowledgement is received confirming that the transport connection is established. */
- (UMDiameterPeerState *)eventI_Rcv_Conn_Ack:(UMDiameterPeer *)peer
                                     message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_Conn_Ack",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_Conn_Ack:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_Conn_Ack",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

/*  Rcv-Conn-Nack  A negative acknowledgement was received stating that the transport connection was not established. */
- (UMDiameterPeerState *)eventI_Rcv_Conn_Nack:(UMDiameterPeer *)peer
                                      message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_Conn_Nack",self.currentState];
        [peer logDebug:s];

        [peer.router stopReceivingOnSocket:peer.initiator_socket forPeer:peer];
        [peer.initiator_socket close];
    }
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventR_Rcv_Conn_Nack:(UMDiameterPeer *)peer
                                      message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_Conn_Nack",self.currentState];
        [peer logDebug:s];

        [peer.router stopReceivingOnSocket:peer.responder_socket forPeer:peer];
        [peer.initiator_socket close];

    }
    return [[UMDiameterPeerState_Closed alloc]init];
}


/*  Timeout:An application-defined timer has expired while waiting for some event.*/
- (UMDiameterPeerState *)eventTimeout:(UMDiameterPeer *)peer
                              message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventTimeout",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-CER: A CER message from the peer was received. */
- (UMDiameterPeerState *)eventR_Rcv_CER:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_CER",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_CER:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_CER",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-CEA: A CEA message from the peer was received.  */
- (UMDiameterPeerState *)eventR_Rcv_CEA:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_CEA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_CEA:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_CEA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-Non-CEA: A message, other than a CEA, from the peer was received. */
- (UMDiameterPeerState *)eventR_Rcv_Non_CEA:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_Non_CEA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_Non_CEA:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_Non_CEA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Peer-Disc: A disconnection indication from the peer was received. */
- (UMDiameterPeerState *)eventI_Peer_Disc:(UMDiameterPeer *)peer
                                  message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Peer_Disc. Choosing closing",self.currentState];
        [peer logDebug:s];
    }
    //[peer actionI_Disc:NULL];
    return [[UMDiameterPeerState_Closed alloc]init];
}

- (UMDiameterPeerState *)eventR_Peer_Disc:(UMDiameterPeer *)peer
                                  message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Peer_Disc",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-DPR: A DPR message from the peer was received. */
- (UMDiameterPeerState *)eventR_Rcv_DPR:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_DPR",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DPR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_DPR",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

/* Rcv-DPA:A DPA message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_DPA:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_DPA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DPA:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_DPA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}



/* Rcv-DWR: A DWR message from the peer was received. */
- (UMDiameterPeerState *)eventR_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_DWR",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventI_Rcv_DWR:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_DWR",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-DWA:A DWA message from the peer was received. */
- (UMDiameterPeerState *)eventI_Rcv_DWA:(UMDiameterPeer *)peer
                                message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_DWA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_DWA:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_DWA",self.currentState];
        [peer logDebug:s];
    }
    return self;
}



/* Win-Election: An election was held, and the local node was the winner. */
- (UMDiameterPeerState *)eventWin_Election:(UMDiameterPeer *)peer
                                   message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventWin_Election",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Send-Message:A message is to be sent. */
- (UMDiameterPeerState *)eventSend_Message:(UMDiameterPeer *)peer message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventSend_Message",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Rcv-Message:A message other than CER, CEA, DPR, DPA, DWR, or DWA was received. */
- (UMDiameterPeerState *)eventI_Rcv_Message:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventI_Rcv_Message",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

- (UMDiameterPeerState *)eventR_Rcv_Message:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventR_Rcv_Message",self.currentState];
        [peer logDebug:s];
    }
    return self;
}


/* Stop: The Diameter application has signaled that a connection should be terminated (e.g., on system shutdown). */
- (UMDiameterPeerState *)eventStop:(UMDiameterPeer *)peer
                           message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventStop",self.currentState];
        [peer logDebug:s];
    }

    [peer.initiator_socket close];
    [peer.responder_socket close];
    [peer startReopenTimer1];
    return [[UMDiameterPeerState_Closed alloc]init];
}


- (UMDiameterPeerState *)eventWatchdogTimer:(UMDiameterPeer *)peer
                                    message:(UMDiameterPacket *)message
{
    if(peer.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"Unhandled Event in STATE=%@: eventWatchdogTimer",self.currentState];
        [peer logDebug:s];
    }
    return self;
}

@end
