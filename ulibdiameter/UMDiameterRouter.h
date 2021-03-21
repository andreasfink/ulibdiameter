//
//  UMDiameterRouter.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibdb/ulibdb.h>
#import "UMDiameterMessage.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouterSession.h"
#import "UMDiameterTcpConnectionAuthorisationProtocol.h"
#import "UMDiameterLocalUserProtocol.h"

@class UMDiameterRouterReceiver;

@class UMDiameterRoute;
@class UMDiameterStatisticDb;

@protocol UMDiameterRouterAppDelegateProtocol
- (UMSynchronizedDictionary *)dbPools;
@end

@interface UMDiameterRouter : UMLayer
{
    time_t _startupTime;
    NSUInteger _nextSeqNumber;
	UMSynchronizedDictionary *_peers;
    UMSynchronizedDictionary *_sessions;
    UMSynchronizedDictionary *_routes;
    UMDiameterRouterReceiver *_receiver;

    UMThroughputCounter *_inboundThroughputPackets;
    UMThroughputCounter *_outboundThroughputPackets;
    NSTimeInterval      _defaultSessionTimeout;
    UMTimer *_housekeepingTimer;
    UMMutex *_housekeepingLock;
    UMMutex *_sequenceNumberLock;
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
    NSMutableArray<NSDictionary *>  *_wantedVendorSpecificIds;
    NSMutableArray<NSNumber *>      *_inbandSecurityIds;
    NSMutableArray<NSNumber *>      *_authApplicationIds;
    NSMutableArray<NSNumber *>      *_acctApplicationIds;
    id<UMDiameterLocalUserProtocol> _localUser;
    
    NSMutableArray<UMSocket *>      *_listeners; /* all listening sockets which wait for incoming connections */
    BOOL                            _listenersStarted;
    NSMutableArray                  *_establishedSockets; /* all sockets which wait for incoming data */
    UMSocketSCTPRegistry            *_sctpRegistry;
    
    uint32_t _sid_int1;
    uint32_t _sid_int2;
    UMMutex *_sid_lock;
    UMMutex *_listenerLock;
    UMDiameterStatisticDb  *_statisticDb;
    NSString *_statisticDbPool;
    NSString *_statisticDbTable;
    NSString *_statisticDbInstance;
    NSNumber *_statisticDbAutoCreate;
    id<UMDiameterRouterAppDelegateProtocol> _appContext;
}

@property(readwrite,strong,atomic)  NSString    *localHostName;
@property(readwrite,strong,atomic)  NSString    *localRealm;
@property(readwrite,assign,atomic)  uint32_t    vendorId;
@property(readwrite,strong,atomic)  NSString    *productName;
@property(readwrite,strong,atomic)  NSNumber    *firmwareRevision;
@property(readonly,copy,atomic)     NSArray<NSNumber *> *supportedVendorIds;
@property(readonly,copy,atomic)     NSArray<NSDictionary *> *vendorSpecificIds;
@property(readonly,copy,atomic)     NSArray<NSDictionary *> *wantedVendorSpecificIds;
@property(readonly,copy,atomic)     NSArray<NSNumber *> *inbandSecurityIds;
@property(readonly,copy,atomic)     NSMutableArray<NSNumber *>  *authApplicationIds;
@property(readonly,copy,atomic)     NSMutableArray<NSNumber *>  *acctApplicationIds;

@property(readwrite,strong,atomic)  id<UMDiameterLocalUserProtocol> localUser;
@property(readwrite,assign,atomic)  uint32_t    origin_state_id;

@property(readwrite,strong,atomic) UMSynchronizedDictionary *peers;
@property(readwrite,strong,atomic) UMSynchronizedDictionary *sessions;
@property(readwrite,strong,atomic) UMSynchronizedDictionary *routes;

@property(readwrite,strong,atomic) UMDiameterStatisticDb  *statisticDb;

- (NSArray *)getListeners;
- (NSArray *)getReceivignSockets;
- (void)startReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer;
- (void)stopReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer;

- (uint32_t)nextEndToEndIdentifier;

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext;
- (void)stopDetachAndDestroy;

- (UMDiameterTcpConnectionAuthorisationResult)authorizeIncomingDiameterTcpConnection:(UMSocket *)socket;

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name;

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt
                      session:(UMDiameterRouterSession *)session
                       source:(UMDiameterPeer *)peer
                        realm:(NSString *)realm
                         host:(NSString *)host;

- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt
                              session:(UMDiameterRouterSession *)session
                               source:(UMDiameterPeer *)peer
                                realm:(NSString *)realm
                                 host:(NSString *)host;


- (void)removeSession:(UMDiameterRouterSession *)session;
- (void)addSession:(UMDiameterRouterSession *)session;
- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt fromPeer:(UMDiameterPeer *)peer;
- (UMDiameterRouterSession *)findSessionByInternalSessionId:(NSString *)sid;
- (UMDiameterPeer *) getPeerForSocket:(UMSocket *)socket;

- (void)addPeer:(UMDiameterPeer *)peer;
- (void)start;

- (BOOL)localSendPacket:(UMDiameterPacket *)pkt
                 toPeer:(UMDiameterPeer *)peer;

- (void)processIncomingPacket:(UMDiameterPacket *)packet
                     fromPeer:(UMDiameterPeer *)peer
                        realm:(NSString *)realm
                         host:(NSString *)host;


- (void)addRoute:(UMDiameterRoute *)route;
- (void)addRouteFromConfig:(NSDictionary *)config;


- (UMDiameterRoute *)findRouteForRouteSelector:(NSNumber *)sel;
- (UMDiameterRoute *)findRouteForRealm:(NSString *)realm;
- (UMDiameterRoute *)findRouteForHost:(NSString *)host;
- (UMDiameterRoute *)findRouteForDefault;

- (UMDiameterPeer *)findPeer:(NSString *)peerName;
- (UMSynchronizedSortedDictionary *)routeTestForPeerName:(NSString *)peerName
                                                   realm:(NSString *)realm
                                                    host:(NSString *)host;


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

+ (NSString *)internalSessionIdFromHopByHop:(uint32_t)hopByHop
                                   endToEnd:(uint32_t)endToEnd
                           incomingPeerName:(NSString *)peerName;

- (void)addPacketStatistic:(UMDiameterPacket *)packet
              incomingPeer:(NSString *)incomingPeer
              outgoingPeer:(NSString *)outgoingPeer;

- (void)processLocalOutgoingRequest:(UMDiameterPacket *)packet;
- (void)dumpRoutes;

@end
