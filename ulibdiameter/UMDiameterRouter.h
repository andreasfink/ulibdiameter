//
//  UMDiameterRouter.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "UMDiameterMessage.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouterSession.h"
#import "UMDiameterTcpConnectionAuthorisationProtocol.h"
#import "UMDiameterLocalUserProtocol.h"
@class UMDiameterRouterReceiver;

@class UMDiameterRoute;

@protocol UMDiameterRouterAppDelegateProtocol
@end

@interface UMDiameterRouter : UMLayer
{
	UMSynchronizedDictionary *_peers;
    UMSynchronizedDictionary *_sessions;
    UMSynchronizedDictionary *_routes;
    UMDiameterRouterReceiver *_receiver;

    UMThroughputCounter *_inboundThroughputPackets;
    UMThroughputCounter *_outboundThroughputPackets;
    NSTimeInterval      _defaultSessionTimeout;
    UMTimer *_housekeepingTimer;
    UMMutex *_housekeepingLock;
    NSString    *_localHostName;
    NSString    *_localRealm;
    uint32_t    _vendorId;
    NSString    *_productName;
    NSNumber    *_firmwareRevision;
    UMMutex     *_endToEndIdentifierLock;
    uint32_t    _lastEndToEndIdentifier;
    uint32_t    _origin_state_id;

    NSMutableArray<NSNumber *>      *_supportedVendorIds;
    NSMutableArray<NSDictionary *>  *_vendorSpecificIds;
    NSMutableArray<NSNumber *>      *_inbandSecurityIds;
    NSMutableArray<NSNumber *>      *_authApplicationIds;
    id<UMDiameterLocalUserProtocol> _localUser;
    
    NSMutableArray<UMSocket *>      *_listeners; /* all listening sockets which wait for incoming connections */
    BOOL                            _listenersStarted;
    NSMutableArray                  *_establishedSockets; /* all sockets which wait for incoming data */
    UMSocketSCTPRegistry            *_sctpRegistry;
    
    uint32_t _sid_int1;
    uint32_t _sid_int2;
    UMMutex *_sid_lock;
    UMMutex *_listenerLock;
}

@property(readwrite,strong,atomic)  NSString    *localHostName;
@property(readwrite,strong,atomic)  NSString    *localRealm;
@property(readwrite,assign,atomic)  uint32_t    vendorId;
@property(readwrite,strong,atomic)  NSString    *productName;
@property(readwrite,strong,atomic)  NSNumber    *firmwareRevision;
@property(readonly,copy,atomic)     NSArray<NSNumber *> *supportedVendorIds;
@property(readonly,copy,atomic)     NSArray<NSDictionary *> *vendorSpecificIds;
@property(readonly,copy,atomic)     NSArray<NSNumber *> *inbandSecurityIds;
@property(readonly,copy,atomic)     NSMutableArray<NSNumber *>  *authApplicationIds;
@property(readwrite,strong,atomic)  id<UMDiameterLocalUserProtocol> localUser;
@property(readwrite,assign,atomic)  uint32_t    origin_state_id;

@property(readwrite,strong,atomic) UMSynchronizedDictionary *peers;
@property(readwrite,strong,atomic) UMSynchronizedDictionary *sessions;
@property(readwrite,strong,atomic) UMSynchronizedDictionary *routes;
- (NSArray *)getListeners;
- (NSArray *)getReceivignSockets;
- (void)startReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer;
- (void)stopReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer;

- (uint32_t)nextEndToEndIdentifier;

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext;
- (void)stopDetachAndDestroy;

- (UMDiameterTcpConnectionAuthorisationResult)authorizeIncomingDiameterTcpConnection:(UMSocket *)socket;

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name;

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt           source:(UMDiameterPeer *)peer;
- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer;

- (UMDiameterRouterSession *)findSessionById:(NSString *)sid;
- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt;
- (UMDiameterPeer *) getPeerForSocket:(UMSocket *)socket;

- (void)addPeer:(UMDiameterPeer *)peer;
- (void)start;

- (BOOL)localSendPacket:(UMDiameterPacket *)p toPeer:(UMDiameterPeer *)peer; /* peer can be NULL if route has to be discovered */
- (void)processIncomingPacket:(UMDiameterPacket *)packet fromPeer:(UMDiameterPeer *)peer;

- (void)addRoute:(UMDiameterRoute *)route;
- (void)addRouteFromConfig:(NSDictionary *)config;

/* local processing */
- (void)processIncomingRequestPacket:(UMDiameterPacket *)packet
                            fromPeer:(UMDiameterPeer *)peer;
- (void)processIncomingErrorPacket:(UMDiameterPacket *)packet
                          fromPeer:(UMDiameterPeer *)peer;
- (void)processIncomingResponsePacket:(UMDiameterPacket *)packet
                             fromPeer:(UMDiameterPeer *)peer;

- (UMSocketError)handlePollResult:(int)revent
                           socket:(UMSocket *)socket
                        poll_time:(UMMicroSec)poll_time
                       isListener:(BOOL) isListener;

- (UMSynchronizedSortedDictionary *)diameterStatus;

@end
