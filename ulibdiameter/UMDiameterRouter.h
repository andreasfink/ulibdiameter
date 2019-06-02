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

@protocol UMDiameterRouterAppDelegateProtocol
@end

@interface UMDiameterRouter : UMLayer
{
	UMSynchronizedDictionary *_peers;
    UMSynchronizedDictionary *_sessions;
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

    NSMutableArray<NSNumber *>     *_supportedVendorIds;
    NSMutableArray<NSDictionary *>  *_vendorSpecifIds;
    UMSynchronizedArray *_inbandSecurityIds;
    UMSynchronizedArray *_authApplicationIds;
}

@property(readwrite,strong,atomic)  NSString    *localHostName;
@property(readwrite,strong,atomic)  NSString    *localRealm;
@property(readwrite,assign,atomic)  uint32_t    vendorId;
@property(readwrite,strong,atomic)  NSString    *productName;
@property(readwrite,strong,atomic)  NSNumber    *firmwareRevision;
@property(readonly,copy,atomic)     NSArray<NSNumber *> *supportedVendorIds;
@property(readonly,copy,atomic)     NSArray<NSDictionary *> *vendorSpecificIds;
@property(readwrite,strong,atomic)  UMSynchronizedArray *inbandSecurityIds;
@property(readwrite,strong,atomic)  UMSynchronizedArray *authApplicationIds;

- (uint32_t)nextEndToEndIdentifier;

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext;
- (void)stopDetachAndDestroy;

- (UMDiameterTcpConnectionAuthorisationResult)authorizeIncomingDiameterTcpConnection:(UMSocket *)socket;

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name;

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt           source:(UMDiameterPeer *)peer;
- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer;

- (UMDiameterRouterSession *)findSessionById:(NSString *)sid;
- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt;
- (UMDiameterPeer *) getPeerForConnection:(UMDiameterTcpConnection *)connection;

- (void)addPeer:(UMDiameterPeer *)peer;
- (void)start;

- (BOOL)localSendPacket:(UMDiameterPacket *)p toPeer:(UMDiameterPeer *)peer; /* peer can be NULL if route has to be discovered */

@end
