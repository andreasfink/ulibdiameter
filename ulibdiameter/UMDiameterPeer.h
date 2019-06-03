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

@interface UMDiameterPeer : UMLayer<UMLayerUserProtocol,UMLayerSctpUserProtocol>
{
	BOOL					_tcpPeer;
	NSString				*_tcpRemoteIP;
	int						_tcpRemotePort;
	UMDiameterTcpConnection	*_tcpConnection;
    UMLayerSctp             *_sctp;
    UMDiameterRouter        *_router;
    SCTP_Status             _sctpStatus;
    UMDiameterPeerState     *_peerState;
    BOOL                    _isIncoming;
    BOOL                    _isConnected;
    BOOL                    _isActive;
    BOOL                    _isConnecting;
    BOOL                    _isForcedOutOfService;

    UMMutex                 *_nextHopIdentifierLock;
    NSNumber                *_originStateId;

    uint32_t                _lastHopByHopIdentifier;
    uint32_t                _lastReceivedHopByHopIdentifier;
    uint32_t                _lastReceivedEndtoEndIdentifier;
    
    UMPCAPFile              *_packetTraceFile;
    UMPCAPPseudoConnection  *_packetTracePseudoConnection;
}

@property(readwrite,assign,atomic)		BOOL					tcpPeer;
@property(readwrite,strong,atomic)		NSString				*tcpRemoteIP;
@property(readwrite,assign,atomic)		int						tcpRemotePort;
@property(readwrite,strong,atomic)		UMDiameterTcpConnection	*tcpConnection;
@property(readwrite,strong,atomic)      UMLayerSctp             *sctp;
@property(readwrite,strong,atomic)      UMDiameterRouter        *router;
@property(readwrite,strong,atomic)      UMDiameterPeerState     *peerState;
@property(readwrite,assign,atomic)      BOOL                    isConnected;
@property(readwrite,assign,atomic)      BOOL                    isActive;
@property(readwrite,assign,atomic)      BOOL                    isConnecting;
@property(readwrite,assign,atomic)      BOOL                    isForcedOutOfService;
@property(readwrite,strong,atomic)      UMPCAPFile              *packetTraceFile;
@property(readwrite,strong,atomic)      UMPCAPPseudoConnection  *packetTracePseudoConnection;
@property(readwrite,strong,atomic)      NSNumber                *originStateId;

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterPeerAppDelegateProtocol>)appContext;
- (void) stopDetachAndDestroy;
- (void) sendCER;
- (void)sendCEA:(uint32_t)hopByHop
       endToEnd:(uint32_t)endToEnd
     resultCode:(uint32_t)resultCode
   errorMessage:(NSString *)errorMessage
      failedAvp:(NSArray *)failedAvp;

- (void)powerOn;
- (void)powerOff;

- (void)sendPacket:(UMDiameterPacket *)packet;

- (void)processCER:(UMDiameterPacket *)pkt;
- (void)processCEA:(UMDiameterPacket *)pkt;
- (void)processDWR:(UMDiameterPacket *)pkt;
- (void)processDWA:(UMDiameterPacket *)pkt;
- (void)processDCR:(UMDiameterPacket *)pkt;
- (void)processDCA:(UMDiameterPacket *)pkt;

@end


