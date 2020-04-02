//
//  UMDiameterPeer.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibsctp/ulibsctp.h>
#import <ulibpcap/ulibpcap.h>

#define DIAMETER_SCTP_PPID_CLEAR 46
#define DIAMETER_SCTP_PPID_DTLS  47

@protocol UMDiameterPeerAppDelegateProtocol
- (UMLayerSctp *)getSCTP:(NSString *)name;
@end

@class UMDiameterPeerState;
@class UMDiameterRouter;
@class UMDiameterTcpConnection;
@class UMDiameterPacket;
@class UMDiameterAVP;

@interface UMDiameterPeer : UMLayer<UMLayerUserProtocol,UMLayerSctpUserProtocol>
{
	BOOL					_tcpPeer;
    NSArray                 *_configuredLocalAddresses;
    NSArray                 *_configuredRemoteAddresses;
    int                     _initiatorPort;
    int                     _responderPort;
    UMSocket                *_initiator_socket; /* initiator */
    UMSocket                *_responder_socket; /* responder */
    UMDiameterRouter        *_router;
    UMSocketStatus          _sctpStatus_i;
    UMSocketStatus          _sctpStatus_r;
    UMDiameterPeerState     *_peerState;
    BOOL                    _isIncoming;
    BOOL                    _isConnected;
    BOOL                    _isActive;
    BOOL                    _isConnecting;
    BOOL                    _isForcedOutOfService;
    BOOL                    _shouldSendCER; /* this triggers a CER after the first CER is received from the remote */
    UMMutex                 *_nextHopIdentifierLock;
    NSNumber                *_originStateId;

    uint32_t                _lastHopByHopIdentifier;
    uint32_t                _lastReceivedHopByHopIdentifier;
    uint32_t                _lastReceivedEndtoEndIdentifier;
    
    UMPCAPFile              *_packetTraceFile;
    UMPCAPPseudoConnection  *_packetTracePseudoConnection;

    NSDate                  *_lastWatchdogRequestSent;
    NSDate                  *_lastWatchdogAnswerReceived;
    NSDate                  *_lastWatchdogRequestReceived;
    NSDate                  *_lastWatchdogAnswerSent;
    
    UMTimer                 *_housekeepingTimer;
    UMTimer                 *_watchdogTimer;
    int                     _outstandingWatchdogEvents;
    int                     _maxOutstandingWatchdogEvents;
    
    double                  _heartbeatSeconds;
    int                     _mtu;
    UMMutex                 *_eventLock;
    UMMutex                 *_dataBuffersLock;
    NSMutableData           *_initiator_receive_buffer;
    NSMutableData           *_responder_receive_buffer;
}

@property(readwrite,assign,atomic)  BOOL					tcpPeer;
@property(readwrite,strong,atomic)  NSArray<NSString *>     *configuredLocalAddresses;
@property(readwrite,strong,atomic)  NSArray<NSString *>     *configuredRemoteAddresses;
@property(readwrite,strong,atomic)  UMSocket                *initiator_socket; /* initiator */
@property(readwrite,strong,atomic)  UMSocket                *responder_socket; /* responder */
@property(readwrite,assign,atomic)  int                     initiatorPort;
@property(readwrite,assign,atomic)  int                     responderPort;
@property(readwrite,strong,atomic)  UMDiameterTcpConnection	*tcpConnection;
@property(readwrite,strong,atomic)  UMLayerSctp             *sctp_r;
@property(readwrite,strong,atomic)  UMLayerSctp             *sctp_i;
@property(readwrite,strong,atomic)  UMDiameterRouter        *router;
@property(readwrite,strong,atomic)  UMDiameterPeerState     *peerState;
@property(readwrite,assign,atomic)  BOOL                    isConnected;
@property(readwrite,assign,atomic)  BOOL                    isActive;
@property(readwrite,assign,atomic)  BOOL                    isConnecting;
@property(readwrite,assign,atomic)  BOOL                    isForcedOutOfService;
@property(readwrite,strong,atomic)  UMPCAPFile              *packetTraceFile;
@property(readwrite,strong,atomic)  UMPCAPPseudoConnection  *packetTracePseudoConnection;
@property(readwrite,strong,atomic)  NSNumber                *originStateId;

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterPeerAppDelegateProtocol>)appContext;
- (void) stopDetachAndDestroy;

- (void)powerOn;
- (void)powerOff;

- (void)sendMessage:(UMDiameterPacket *)packet;


/* Snd-Conn-Req: A transport connection is initiated with the peer. */
- (UMSocketError)actionI_Snd_Conn_Req:(UMDiameterPacket *)message;

/* Accept: The incoming connection associated with the R-Conn-CER is accepted as the responder connection.*/
- (void)actionR_Accept:(UMDiameterPacket *)message;

/* Reject: The incoming connection associated with the R-Conn-CER is disconnected.*/
- (void)actionReject:(UMDiameterPacket *)message;
- (void)actionR_Reject:(UMDiameterPacket *)message;


/* Process-CER:  The CER associated with the R-Conn-CER is processed. */
- (void)actionProcess_CER:(UMDiameterPacket *)message;

/* Snd-CER        A CER message is sent to the peer. */
- (void)actionSnd_CER:(UMDiameterPacket *)message;
- (void)actionI_Snd_CER:(UMDiameterPacket *)message;

/* Snd-CEA        A CEA message is sent to the peer. */
- (void)actionSnd_CEA:(UMDiameterPacket *)message;
- (void)actionR_Snd_CEA:(UMDiameterPacket *)message;

/* Cleanup: If necessary, the connection is shut down, and any local resources are freed. */
- (void)actionCleanup:(UMDiameterPacket *)message;

/* Error: The transport layer connection is disconnected, either politely or abortively, in response to, an error condition.  Local resources are freed. */
- (void)actionError:(UMDiameterPacket *)message;

/* Process-CEA    A received CEA is processed. */
- (void)actionProcess_CEA:(UMDiameterPacket *)message;

/* Snd-DPR A DPR message is sent to the peer. */
- (void)actionR_Snd_DPR:(UMDiameterPacket *)message;
- (void)actionI_Snd_DPR:(UMDiameterPacket *)message;

/* Snd-DPA A DPA message is sent to the peer. */
- (void)actionR_Snd_DPA:(UMDiameterPacket *)message;
- (void)actionI_Snd_DPA:(UMDiameterPacket *)message;


/* Disc: The transport layer connection is disconnected, and local resources are freed. */
- (void)actionDisc:(UMDiameterPacket *)message;
- (void)actionI_Disc:(UMDiameterPacket *)message;
- (void)actionR_Disc:(UMDiameterPacket *)message;

/* Elect: An election occurs (see Section 5.6.4 for more information). */
- (void)actionElect:(UMDiameterPacket *)message;

/* Snd-Message    A message is sent. */
- (void)actionSnd_Message:(UMDiameterPacket *)message;
- (void)actionI_Snd_Message:(UMDiameterPacket *)message;
- (void)actionR_Snd_Message:(UMDiameterPacket *)message;

/* Snd-DWR        A DWR message is sent. */
- (void)actionSnd_DWR:(UMDiameterPacket *)message;
- (void)actionI_Snd_DWR:(UMDiameterPacket *)message;
- (void)actionR_Snd_DWR:(UMDiameterPacket *)message;

/* Snd-DWA        A DWA message is sent. */
- (void)actionI_Snd_DWA:(UMDiameterPacket *)message;
- (void)actionR_Snd_DWA:(UMDiameterPacket *)message;

/* Process-DWR    The DWR message is serviced. */
- (void)actionProcess_DWR:(UMDiameterPacket *)message;

/* Process-DWA    The DWA message is serviced. */
- (void)actionProcess_DWA:(UMDiameterPacket *)message;

/* Process        A message is serviced. */
- (void)actionProcessMessage:(UMDiameterPacket *)message;


- (UMDiameterPacket *)createDWR;
- (UMDiameterPacket *)createDWA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray *)failedAvp;

- (UMDiameterPacket *)createDPRwithDisconnectCause:(NSNumber *)dcause;

- (UMDiameterPacket *)createDPA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray *)failedAvp;

- (UMDiameterPacket *)createCER;
- (UMDiameterPacket *)createCEA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray<UMDiameterAVP *>*)failedAvp;

- (NSString *)statusString;

- (UMSocketError)handlePollResultInitiator:(int)revent
                           socket:(UMSocket *)socket
                        poll_time:(UMMicroSec)poll_time;

- (UMSocketError)handlePollResultResponder:(int)revent
                                    socket:(UMSocket *)socket
                                 poll_time:(UMMicroSec)poll_time;

- (void)connectionUpForSocket:(UMSocket *)sock;

@end


