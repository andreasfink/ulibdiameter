//
//  UMDiameterRouter.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouter.h"
#import "UMDiameterRouter_RouteTask.h"
#import "UMDiameterRouterSession.h"
#import "UMDiameterPacket.h"
#import "UMDiameterApplicationId.h"
#import "UMDiameterVendorId.h"
#import "UMDiameterRoute.h"
#import "UMDiameterPacketsAll.h"
#import "UMDiameterRouterReceiver.h"

#include <poll.h>

@implementation UMDiameterRouter

- (UMDiameterRouter *)init
{
    @throw([NSException exceptionWithName:@"API" reason:@"call [UMDiameterRouter initWithTaskQueueMulti:name:] instead" userInfo:NULL]);
    return NULL;
}

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    return [self initWithTaskQueueMulti:tq name:@"UMDiameterRouter"];
}

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name
{
    self = [super initWithTaskQueueMulti:tq name:name];
    if(self)
    {
		_peers = [[UMSynchronizedDictionary alloc]init];
        _sessions = [[UMSynchronizedDictionary alloc]init];
        _routes = [[UMSynchronizedDictionary alloc]init];
        _listeners = [[NSMutableArray alloc]init];
        _establishedSockets = [[NSMutableArray alloc]init];
        _defaultSessionTimeout = 90;
        _inboundThroughputPackets   = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _outboundThroughputPackets  = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _housekeepingTimer = [[UMTimer alloc]initWithTarget:self selector:@selector(housekeeping) object:NULL seconds:30 name:@"housekeeping-timer" repeats:YES];
        _housekeepingLock = [[UMMutex alloc]initWithName:@"housekeeping-timer-lock"];
        _listenerLock     = [[UMMutex alloc]initWithName:@"listener-lock"];
        _sid_lock = [[UMMutex alloc]initWithName:@"diameter-router-sid-lock"];

        _endToEndIdentifierLock = [[UMMutex alloc]initWithName:@"end-to-end-identifier-lock"];
        _vendorId = 54013; /* fts */
        _productName = @"Fink Telecom Services ulibdiameter";
        
        NSString *s = @"2020-01-01 00:00:00.000000";
        NSDate *zeroDay = [s dateValue];
        NSTimeInterval timeShift = [[NSDate date] timeIntervalSinceDate:zeroDay];
        _origin_state_id = (uint32_t)timeShift;
        
        _supportedVendorIds = [[NSMutableArray alloc]init];
        [_supportedVendorIds addObject:@(0xFFFFFFFF)];

        _authApplicationIds = [[NSMutableArray alloc]init];
        [_authApplicationIds addObject:@(0xFFFFFFFF)];

        _inbandSecurityIds = [[NSMutableArray alloc]init];
        [_inbandSecurityIds addObject:@(0)]; /* means NO_INBAND_SECURITY */
        _firmwareRevision = @(1);


        _vendorSpecificIds = [[NSMutableArray alloc]init];
        [_vendorSpecificIds addObject:@{
                                        @"vendor":@(UMDiameterVendorId_3GPP) ,
                                        @"application": @(UMDiameterApplicationId_3GPP_S6a_S6d)
                                        }];
        [_vendorSpecificIds addObject:@{
                                        @"vendor":@(UMDiameterVendorId_3GPP) ,
                                        @"application": @(UMDiameterApplicationId_3GPP_S9)
                                        }];
        [_vendorSpecificIds addObject:@{
                                        @"vendor":@(UMDiameterVendorId_3GPP) ,
                                        @"application": @(UMDiameterApplicationId_3GPP_SLh)
                                        }];

        /* AF to HSS */
        [_vendorSpecificIds addObject:@{
                                        @"vendor":@(UMDiameterVendorId_3GPP) ,
                                        @"application": @(UMDiameterApplicationId_3GPP_Sh)
                                        }];
#if 0
        /* CSCF - HSS */
        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Cx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Diameter_Data_Management)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gmb)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gq)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx_over_Gy)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx2)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gxx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_MB2_C)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_MM10)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Np)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Ns)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Nt)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Nta)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC2)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC2_2)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC4a)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC6_PC7)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Pr)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Re)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Rx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Rx2)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S13)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S15)
                                      }];


        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6b)
                                      }];
#endif
        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6c)
                                      }];
#if 0
        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6m)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6t)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S7a)
                                      }];


        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S9a)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S9a_2)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sd)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SGd)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SGmb)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sh)
                                      }];


        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_St)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sta)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SWm)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SWx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sy)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_T4)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_T6a_T6b)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Tsp)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_V4)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_V6)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Wx)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zh)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zn)
                                      }];

        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zpn)
                                      }];
        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_FinkTelecomServices) ,
                                      @"application": @(UMDiameterApplicationId_FTS_Routing)
                                      }];
        [_vendorSpecificIds addObject:@{
                                      @"vendor":@(UMDiameterVendorId_FinkTelecomServices) ,
                                      @"application": @(UMDiameterApplicationId_FTS_UMTransport)
                                    }];
       [_vendorSpecificIds addObject:@{
                                     @"vendor":@(UMDiameterVendorId_FinkTelecomServices) ,
                                     @"application": @(UMDiameterApplicationId_FTS_Tracing)
                                   }];
#endif
}
    return self;
}

- (void)housekeeping
{
    if([_housekeepingLock tryLock]==0)
    {
        /* */
        NSArray *arr = [_sessions allKeys];
        for(NSString *sid in arr)
        {
            UMDiameterRouterSession *session = [self findSessionById:sid];
            if([session isExpired])
            {
                [session expire];
            }
        }
        [_housekeepingLock unlock];

    }
}

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt
                       source:(UMDiameterPeer *)peer
                        realm:(NSString *)realm
                         host:(NSString *)host
{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt
                                                                                   realm:realm
                                                                                    host:host];
    [self queueFromLower:task];
}

- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt
                               source:(UMDiameterPeer *)peer
                                realm:(NSString *)realm
                                 host:(NSString *)host

{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt
                                                                                   realm:realm
                                                                                    host:host];
    [self queueFromLowerWithPriority:task];
}

- (NSString *)newSessionIdentifier
{
    [_sid_lock lock];
    if(_sid_int1 == 0)
    {
        _sid_int1 = (uint32_t)time(NULL);
        _sid_int2 = 0;
    }
    if(_sid_int2 == INT32_MAX)
    {
        _sid_int1++;
        _sid_int2=0;
    }
    else
    {
        _sid_int2++;
    }
    NSString *sid = [NSString stringWithFormat:@"%@;%u;%u", _localHostName,_sid_int1,_sid_int2];
    [_sid_lock unlock];
    return sid;
}

- (void)addSession:(UMDiameterRouterSession *)session
{
    if(session.sessionIdentifier.length == 0)
    {
        session.sessionIdentifier = [self newSessionIdentifier];
    }
    _sessions[session.sessionIdentifier] = session;
}

- (UMDiameterRouterSession *)findSessionById:(NSString *)sid
{
    return _sessions[sid];
}

- (UMDiameterRouterSession *)findSessionForPacket:(UMDiameterPacket *)pkt
{
    NSString *sid = [pkt getSessionIdentifier];
    if(sid)
    {
        return [self findSessionById:sid];
    }
    return NULL;
}

- (NSString *)findRealmForPacket:(UMDiameterPacket *)pkt
{
    NSString *realm = [pkt getDestinationRealm];
    return realm;
}

- (NSString *)findHostForPacket:(UMDiameterPacket *)pkt
{
    NSString *host = [pkt getDestinationHost];
    return host;
}


- (UMDiameterTcpConnectionAuthorisationResult)authorizeIncomingDiameterTcpConnection:(UMSocket *)socket
{
    /* FIXME: check list of peers */

    /* go through list of peers                    */
    /* find peer where sctp_r points to the remote */
    /* call event for this peer to see if it completes accept or not */
	return UMDiameterTcpConnectionAuthorisationResult_successful;
}


/* this is used for incoming  peers */
- (UMDiameterPeer *) getPeerForSocket:(UMSocket *)socket
{
	NSArray *peerNames = [_peers allKeys];
    NSString *remoteIP = [UMSocket unifyIP:socket.connectedRemoteAddress];

	for(NSString *peerName in peerNames)
	{
		UMDiameterPeer *peer = _peers[peerName];
		if(peer==NULL)
		{
			continue;
		}
		if((socket.type== UMSOCKET_TYPE_TCP)
		   || (socket.type==UMSOCKET_TYPE_TCP4ONLY)
		   || (socket.type==UMSOCKET_TYPE_TCP6ONLY))
		{
            if(peer.configuredRemoteAddresses.count<1)
            {
               return NULL;
            }
            if( [ [UMSocket unifyIP:peer.configuredRemoteAddresses[0]] isEqualToString:remoteIP])
            {
                if(peer.responderPort == socket.localPort)
                {
                    return peer;
                }
            }
		}
        else if(UMSOCKET_IS_SCTP_TYPE(socket.type))
        {
            for(NSString *socketIP in peer.configuredRemoteAddresses)
            {
                if( [ [UMSocket unifyIP:socketIP] isEqualToString:remoteIP])
                {
                    if(peer.responderPort == socket.localPort)
                    {
                        return peer;
                    }
                }
            }
        }
	}
	return NULL;
}

- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext
{

    [self readLayerConfig:cfg];

    if(cfg[@"name"])
    {
        self.layerName = [cfg[@"name"] stringValue];
    }
    if(cfg[@"local-hostname"])
    {
        self.localHostName = [cfg[@"local-hostname"] stringValue];
    }
    if(cfg[@"local-realm"])
    {
        self.localRealm = [cfg[@"local-realm"] stringValue];
    }
    _vendorId = 54013; /* fink telecom services vendor ID */
}

- (void)stopDetachAndDestroy
{
    /* FIXME */
}

- (void)addPeer:(UMDiameterPeer *)peer
{
    _peers[peer.layerName] = peer;
}

- (void)start
{
    [self updateListeners];
    [self startListening];

    NSArray *peerNames = [_peers allKeys];
    for(NSString *name in peerNames)
    {
        UMDiameterPeer *peer = _peers[name];
        peer.router = self;
        [peer powerOn];
    }
}

- (void)stop
{
    [self stopListening];
    NSArray *peerNames = [_peers allKeys];
    for(NSString *name in peerNames)
    {
        UMDiameterPeer *peer = _peers[name];
        [peer powerOff];
    }
}

- (uint32_t)nextEndToEndIdentifier;
{
    uint32_t r;
    [_endToEndIdentifierLock lock];
    r = ++_lastEndToEndIdentifier;
    [_endToEndIdentifierLock unlock];
    return r;
}


- (BOOL)localSendPacket:(UMDiameterPacket *)pkt
                 toPeer:(UMDiameterPeer *)peer
{
    if(peer == NULL)
    {
        NSArray *names = [_peers allKeys];
        if(names.count == 0)
        {
            return NO;
        }
        /* we take the first peer we find  if its not prerouted */
        peer = _peers[names[0]];
    }
    if(peer == NULL)
    {
        return NO;
    }
    [peer sendMessage:pkt];
    return YES;
}

- (void)processIncomingPacket:(UMDiameterPacket *)packet
                     fromPeer:(UMDiameterPeer *)peer
                        realm:(NSString *)realm
                         host:(NSString *)host
{
    UMDiameterRouterSession *session = [self findSessionForPacket:packet];
    if(session)
    {
        if(session.isLocal)
        {
            /* if we have a session, we use the same route back */
            [session processIncomingPacket:packet forRouter:self fromPeer:peer];
            [session touch];
            return;
        }
        else
        {
            [self queuePacketForRouting:packet
                                 source:peer
                                  realm:realm
                                   host:host];
        }
    }
    else
    {
        session = [[UMDiameterRouterSession alloc]initWithTimeout:_defaultSessionTimeout];
        session.initiator = peer;
    }

#define COMMAND(CMDNAME) \
    else if(packet.commandCode ==  [CMDNAME commandCode]) \
    {  \
        packet = [[CMDNAME alloc]initWithPacket:packet]; \
    }

    if(0)
    {
    }
#include "Commands/3GPP/UMDiameterCommands_3GPP.inc"
#include "Commands/base/UMDiameterCommands_base.inc"

#undef COMMAND

    if(packet.commandFlags & DIAMETER_COMMAND_FLAG_REQUEST)
    {
        [self processIncomingRequestPacket:packet fromPeer:peer];
    }
    else if(packet.commandFlags & DIAMETER_COMMAND_FLAG_ERROR)
    {
        [self processIncomingErrorPacket:packet fromPeer:peer];
    }
    else
    {
        [self processIncomingResponsePacket:packet fromPeer:peer];
    }
}

- (void)processIncomingRequestPacket:(UMDiameterPacket *)packet
                            fromPeer:(UMDiameterPeer *)peer
{
    /* route the packet */
    [_localUser processIncomingRequestPacket:packet router:self peer:peer];
}

- (void)processIncomingErrorPacket:(UMDiameterPacket *)packet
                          fromPeer:(UMDiameterPeer *)peer
{
    [_localUser processIncomingErrorPacket:packet router:self peer:peer];

}

- (void)processIncomingResponsePacket:(UMDiameterPacket *)packet
                             fromPeer:(UMDiameterPeer *)peer
{
    [_localUser processIncomingResponsePacket:packet router:self peer:peer];
}


- (void)addRoute:(UMDiameterRoute *)route
{
    _routes[route.identifier] = route;
}

- (void)addRouteFromConfig:(NSDictionary *)config
{
    UMDiameterRoute *route = [[UMDiameterRoute alloc]initWithConfig:config];
    [self addRoute:route];
}

- (UMDiameterRoute *)findRouteForRealm:(NSString *)realm
{
    UMDiameterRoute *route=NULL;
    NSArray *allKeys = [_routes allKeys];
    for(NSString *key in allKeys)
    {
        UMDiameterRoute *thisRoute =     _routes[key];
        if([thisRoute matchesRealm:realm])
        {
            if(route==NULL)
            {
                route = thisRoute;
            }
            else
            {
                if(thisRoute.priority < route.priority)
                {
                    route = thisRoute;
                }
                else if(thisRoute.priority == route.priority)
                {
                    if(thisRoute.weight > route.weight)
                    {
                        route = thisRoute;
                    }
                }
            }
        }
    }
    return route;
}


- (UMDiameterRoute *)findRouteForHost:(NSString *)hostname
{
    UMDiameterRoute *route=NULL;
    NSArray *allKeys = [_routes allKeys];
    for(NSString *key in allKeys)
    {
        UMDiameterRoute *thisRoute = _routes[key];
        if([thisRoute matchesHost:hostname])
        {
            if(route==NULL)
            {
                route = thisRoute;
            }
            else
            {
                if(thisRoute.priority < route.priority)
                {
                    route = thisRoute;
                }
                else if(thisRoute.priority == route.priority)
                {
                    if(thisRoute.weight > route.weight)
                    {
                        route = thisRoute;
                    }
                }
            }
        }
    }
    return route;
}

- (UMDiameterPeer *)findPeer:(NSString *)peerName
{
    return _peers[peerName];
}
/*
 NSString *_identifier;
 NSString *_destination;
 NSString *_hostname;
 NSString *_realm;
 NSNumber *_applicationId;
 NSString *_sessionId;
 BOOL     _oneTimeRoute;
 BOOL     _local;
 NSNumber *_weight;
 NSNumber *_priority;
 
 */

#if 0
- (UMSocket *)getListenerForPort:(int)port
                    localAddress:(NSString *)address
                      socketType:(UMSocketType )socketType
{
    [_listenerLock lock];
    NSString *key = [NSString stringWithFormat:@"%@/%@/%d",[UMSocket socketTypeDescription:socketType],address,port];
    UMSocket *sock = _listeners[key];
    if(sock==NULL)
    {
        sock = [[UMSocket alloc]initWithType:socketType];
        sock.localHost = [[UMHost alloc]initWithAddress:address];
        sock.requestedLocalPort = port;
        UMSocketError e = [sock bind];
        if(e != UMSocketError_no_error)
        {
            NSString *estr = [UMSocket getSocketErrorString:e];
            [self logMajorError:[NSString stringWithFormat:@"Error during bind(%@): %d %@",key,e,estr]];
            [sock close];
            sock = NULL;
        }
        else
        {
            e = [sock listen];
            if(e != UMSocketError_no_error)
            {
                NSString *estr = [UMSocket getSocketErrorString:e];
                [self logMajorError:[NSString stringWithFormat:@"Error during listen(%@): %d %@",key,e,estr]];
                [sock close];
                sock = NULL;
                
            }
            else
            {
                _listeners[key] = sock;
            }
        }
    }
    [_listenerLock unlock];
    return sock;
}
#endif


- (NSArray *)getListeners
{
    [_listenerLock lock];
    NSArray *a = [_listeners copy];
    [_listenerLock unlock];
    return a;
}

- (NSArray *)getReceivignSockets
{
    [_listenerLock lock];
    NSArray *a = [_establishedSockets copy];
    [_listenerLock unlock];
    return a;
}

- (void)startReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer
{
    [_listenerLock lock];
    socket.customUser = peer;
    [_establishedSockets addObject:socket];
    [_listenerLock unlock];
}

- (void)stopReceivingOnSocket:(UMSocket *)socket forPeer:(UMDiameterPeer *)peer
{
    [_listenerLock lock];
    [_establishedSockets removeObject:socket];
    socket.customUser = NULL;
    [_listenerLock unlock];
}


- (NSArray *)getReceivers
{
    [_listenerLock lock];
    NSArray *a = [_establishedSockets copy];
    [_listenerLock unlock];
    return a;
}

- (void)stopListening
{

    [_listenerLock lock];
    for(UMSocket *socket in _listeners)
    {
        [socket close];
    }
    [_listenerLock unlock];
    _listenersStarted = NO;
}

- (void)startListening
{
    if(_listenersStarted==YES)
    {
        return;
    }
    [_listenerLock lock];
    for(UMSocket *socket in _listeners)
    {
        UMSocketError sErr = UMSocketError_no_error;
        int counter = 0;
        while(counter < 5)
        {
            sErr  = [socket bind];
            if(sErr == UMSocketError_address_already_in_use)
            {
                /* if socket is still in use, we retry */
                usleep(1000000);
                counter += 1;
                continue;
            }
            else
            {
                break;
            }
        }
        if(sErr==UMSocketError_no_error)
        {
            sErr  = [socket listen];
            if(sErr)
            {
                NSString *s = [NSString stringWithFormat:@"can not listen on %@ port %d, %d %@",
                                     [UMSocket socketTypeDescription:socket.type],
                                     socket.requestedLocalPort,
                                     sErr,[UMSocket getSocketErrorString:sErr]];
                [self logMajorError:s];
            }
        }
    }
    if(_receiver==NULL)
    {
        _receiver = [[UMDiameterRouterReceiver alloc]initWithRouter:self];
    }
    [_receiver startBackgroundTask];
    _listenersStarted = YES;
    [_listenerLock unlock];
}


- (void)updateListeners
{
    [_listenerLock lock];
    [self stopListening];
    NSMutableDictionary *listenerKeys = [[NSMutableDictionary alloc]init];
    _listeners = [[NSMutableArray alloc]init];
    NSArray *keys = [_peers allKeys];
    for(id key in keys)
    {

        UMDiameterPeer *peer = _peers[key];
        if(peer)
        {
            NSArray *localIpAddresses = [peer.configuredLocalAddresses sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
            NSString *localIpString = [localIpAddresses componentsJoinedByString:@","];

            if(peer.tcpPeer)
            {
                if (peer.responderPort > 0)
                {

                    NSString *sdup = [NSString stringWithFormat:@"tcp/%@/%d",localIpString,peer.responderPort];
                    if(listenerKeys[sdup]==NULL)
                    {
                        UMSocket *socket = [[UMSocket alloc] initWithType:UMSOCKET_TYPE_TCP];
                        socket.requestedLocalPort = peer.responderPort;
                        socket.localHost = [[UMHost alloc]initWithAddress:localIpAddresses[0]];
                        listenerKeys[sdup] = socket;
                        [_listeners addObject:socket];
                    }
                }
            }
            else
            {
                if (peer.responderPort > 0)
                {
                    NSString *sdup = [NSString stringWithFormat:@"tcp/%@/%d",localIpString,peer.responderPort];
                    if(listenerKeys[sdup]==NULL)
                    {
                        UMSocketSCTP *socket = [[UMSocketSCTP alloc] initWithType:UMSOCKET_TYPE_SCTP_STREAM];
                        socket.requestedLocalPort = peer.responderPort;
                        socket.requestedLocalAddresses = localIpAddresses;
                        listenerKeys[sdup] = socket;
                        [_listeners addObject:socket];
                    }
                }
            }
        }
    }
    [self startListening];
    [_listenerLock unlock];
}

- (UMSocketError)handlePollResult:(int)revent
                           socket:(UMSocket *)socket
                        poll_time:(UMMicroSec)poll_time
                       isListener:(BOOL) isListener
{
    UMSocketError returnValue = UMSocketError_no_error;

    if(revent & (POLLIN | POLLPRI))
    {
        if(socket.customUser)
        {
            UMDiameterPeer *peer = (UMDiameterPeer *)socket.customUser;
            if(peer.initiator_socket == socket)
            {
                returnValue = [peer handlePollResult:revent
                                              socket:socket
                                           poll_time:poll_time
                                           initiator:YES];
                return returnValue;
            }
            else if(peer.responder_socket == socket)
            {
                socket.customUser = peer;
                returnValue = [peer handlePollResult:revent
                                              socket:socket
                                           poll_time:poll_time
                                           initiator:NO];
                return returnValue;
            }
        }
        if(isListener)
        {
            if(!socket.isListening)
            {
                NSLog(@"listener registered but not market as listening");
            }
            /* NEW INCOMING CONNECTIONS */
            UMSocket *nsock;
            if(UMSOCKET_IS_SCTP_TYPE(socket.type))
            {
                UMSocketSCTP *rs = (UMSocketSCTP *)socket;
                rs = [rs acceptSCTP:&returnValue];
                nsock = rs;
                //[rs updateMtu:_mtu];
                [rs switchToNonBlocking];
                [rs setNoDelay];
                [rs setInitParams];
                [rs setIPDualStack];
                [rs setLinger];
                [rs setReuseAddr];
                [rs setReusePort];
                [rs enableEvents];
                [rs setHeartbeat:YES];
            }
            else
            {
                nsock = [socket accept:&returnValue];
            }
            NSString *remoteAddress = nsock.connectedRemoteAddress;
            NSString *localAddress  = nsock.connectedLocalAddress;
            int localPort = nsock.connectedLocalPort;

            remoteAddress = [UMSocket unifyIP:remoteAddress];
            localAddress = [UMSocket unifyIP:localAddress];
            /* we now have to find the matching peer for this address */

            NSArray *peerKeys = [_peers allKeys];
            BOOL listenerHandled = NO;
            for(NSString *key in peerKeys)
            {
                UMDiameterPeer *peer = _peers[key];
                if(peer)
                {
                    //NSArray *localIpAddresses = [peer.configuredLocalAddresses sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
                    NSArray *remoteIpAddresses = [peer.configuredRemoteAddresses sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
                    /* SCTP */
                    for(NSString *ip in remoteIpAddresses)
                    {
                        if(([ip isEqualToString:remoteAddress]) && (peer.responderPort == localPort))
                        {
                            if(peer.responder_socket.isConnected)
                            {
                                [peer.responder_socket close];
                                [_logFeed debugText:@"have a new inbound connection from same source. closing old socket"];
                            }
                            peer.responder_socket = nsock;
                            [self startReceivingOnSocket:nsock forPeer:peer];
                            [peer connectionUpForSocket:nsock];
                            listenerHandled = YES;
                            break;
                        }
                    }
                }
            }
            if(listenerHandled==NO)
            {
                [nsock close];
            }
        }
        else
        {
            if(!socket.isConnected)
            {
                NSLog(@"receiving data on not connected socket?!?");
            }

            UMDiameterPeer *peer = socket.customUser;
            if(peer==NULL)
            {
                NSLog(@"receiving data on socket not connected to a peer?");
            }
            if(socket == peer.initiator_socket)
            {
                returnValue = [peer handlePollResult:revent
                                              socket:socket
                                           poll_time:poll_time
                                           initiator:YES];
            }
            else if(socket == peer.responder_socket)
            {
                returnValue = [peer handlePollResult:revent
                                              socket:socket
                                            poll_time:poll_time
                                           initiator:NO];
            }
            else
            {
                NSLog(@"Neither initiator nor responder socket match?!?");
            }


            /* receiving socket */
        }
    }
    return returnValue;
}

- (UMSynchronizedSortedDictionary *)diameterStatus
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    NSArray *peerNames = [_peers allKeys];
    for(NSString *peerName in peerNames)
    {
        UMDiameterPeer *peer = _peers[peerName];
        if(peer)
        {
            dict[peerName] = [peer diameterStatus];
        }
    }
    return dict;
}

@end

