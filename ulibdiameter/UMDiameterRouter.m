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
#import "UMDiameterTcpConnection.h"
#import "UMDiameterApplicationId.h"
@implementation UMDiameterRouter

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    return [self initWithTaskQueueMulti:tq name:@""];
}

- (UMDiameterRouter *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name
{
    self = [super initWithTaskQueueMulti:tq name:name];
    if(self)
    {
		_peers = [[UMSynchronizedDictionary alloc]init];
		_sessions = [[UMSynchronizedDictionary alloc]init];
        _defaultSessionTimeout = 90;
        _inboundThroughputPackets   = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _outboundThroughputPackets  = [[UMThroughputCounter alloc]initWithResolutionInSeconds: 1.0 maxDuration: 1260.0];
        _housekeepingTimer = [[UMTimer alloc]initWithTarget:self selector:@selector(housekeeping) object:NULL seconds:30 name:@"housekeeping-timer" repeats:YES];
        _housekeepingLock = [[UMMutex alloc]initWithName:@"housekeeping-timer-lock"];
        _endToEndIdentifierLock = [[UMMutex alloc]initWithName:@"end-to-end-identifier-lock"];
        _vendorId = 54013; /* fts */
        _productName = @"Fink Telecom Services ulibdiameter";
        _supportedVendorIds = [[NSMutableArray alloc]init];
        [_supportedVendorIds addObject:@(0xFFFFFFFF)];
        _vendorSpecifIds = [[NSMutableArray alloc]init];
        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Cx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Diameter_Data_Management)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gmb)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gq)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx_over_Gy)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gx2)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Gxx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_MB2_C)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_MM10)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Np)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Ns)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Nt)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Nta)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC2)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC2_2)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC4a)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_PC6_PC7)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Pr)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Re)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Rx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Rx2)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S13)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S15)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6a_S6d)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6b)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6c)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6m)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S6t)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S7a)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S9)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S9a)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_S9a_2)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sd)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SGd)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SGmb)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sh)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SLh)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_St)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sta)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SWm)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_SWx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Sy)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_T4)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_T6a_T6b)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Tsp)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_V4)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_V6)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Wx)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zh)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zn)
                                      }];

        [_vendorSpecifIds addObject:@{
                                      @"vendor":@(UMDiameterApplicationId_3GPP) ,
                                      @"application": @(UMDiameterApplicationId_3GPP_Zpn)
                                      }];

        _inbandSecurityIds = [[UMSynchronizedArray alloc]init];
        [_inbandSecurityIds addObject:@(0)]; /* means NO_INBAND_SECURITY */
        _firmwareRevision = @(1);
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

            }
        }
        [_housekeepingLock unlock];

    }
}

- (void)queuePacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer
{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt];
    [self queueFromLower:task];
}

- (void)queuePriorityPacketForRouting:(UMDiameterPacket *)pkt   source:(UMDiameterPeer *)peer
{

    UMDiameterRouter_RouteTask *task = [[UMDiameterRouter_RouteTask alloc]initWithRouter:self
                                                                                  sender:peer
                                                                                  packet:pkt];
    [self queueFromLowerWithPriority:task];
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
        return _sessions[sid];
    }
    return NULL;
}


- (UMDiameterTcpConnectionAuthorisationResult)authorizeIncomingDiameterTcpConnection:(UMSocket *)socket
{
	/* FIXME: check list of peers */
	return UMDiameterTcpConnectionAuthorisationResult_successful;
}


/* this is used for incoming tcp peers. for SCTP the connections are established outbound/inbound and are nailed down */
- (UMDiameterPeer *) getPeerForConnection:(UMDiameterTcpConnection *)connection
{
#if 0
	NSArray *peerNames = [_peers allKeys];
	NSString *remoteIP = connection.socket.connectedRemoteAddress;

	for(NSString *peerName in peerNames)
	{
		UMDiameterPeer *peer = _peers[peerName];
		if(peer==NULL)
		{
			continue;
		}
		NSString *remoteIP;

		NSString *type;
		if((connection.socket.type!= UMSOCKET_TYPE_TCP)
		   || (connection.socket.type!=UMSOCKET_TYPE_TCP4ONLY)
		   || (connection.socket.type!=UMSOCKET_TYPE_TCP6ONLY))
		{
			UMAssert(0,@"this is not a tcp socket");
			return NULL;
		}
		if(([peer.tcpRemoteIP isEqualToString:connection.socket.connectedRemoteAddress]) &&
			(peer.tcpRemotePort == connection.socket.connectedRemotePort))
		{
			peer.tcpConnection = connection;
			return peer;
		}
	}
#endif
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

- (BOOL)localSendPacket:(UMDiameterPacket *)pkt toPeer:(UMDiameterPeer *)peer /* peer can be NULL if route has to be discovered, Returns YES on success */
{
    if(peer == NULL)
    {
        NSArray *names = [_peers allKeys];
        if(names.count == 0)
        {
            return NO;
        }
        /* we take the first peer for now */
        /* FIXME: do some routing here!! */
        peer = _peers[names[0]];
    }
    if(peer == NULL)
    {
        return NO;
    }
    [peer sendPacket:pkt];
    return YES;
}

@end
