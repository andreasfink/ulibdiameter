//
//  UMDiameterRouter_RouteTask.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouter_RouteTask.h"
#import "UMDiameterRouter.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPeer.h"
#import "UMDiameterRouterSession.h"
#import "UMDiameterRoute.h"
#import "UMDiameterAvpFTSRouteSelector.h"

@implementation UMDiameterRouter_RouteTask


- (UMDiameterRouter_RouteTask *)initWithRouter:(UMDiameterRouter *)router
                                       session:(UMDiameterRouterSession *)session
                                        sender:(UMDiameterPeer *)sender
                                        packet:(UMDiameterPacket *)packet
                                         realm:(NSString *)realm
                                          host:(NSString *)host
{
    self = [super initWithName:[[self class]description]
                      receiver:router
                        sender:sender
       requiresSynchronisation:NO];
    if(self)
    {
        _session = session;
        _packet = packet;
        _sender = sender;
        _router = router;
        _realm = realm;
        _host = host;
    }
    return self;
}

- (void)main
{
    @autoreleasepool
    {
        NSString *ougoingPeerName = @"";
        UMDiameterPeer *nextHop=NULL;
        BOOL isRequest = _packet.flagRequest;
        if(_session)
        {
            /* if we have a session, we use the same route back */
            [_session touch];
            if(_session.initiator == _sender)
            {
                nextHop = _session.responder;
                ougoingPeerName = nextHop.layerName;
            }
            else if(_session.responder == _sender)
            {
                nextHop = _session.initiator;
                ougoingPeerName = nextHop.layerName;
            }
            else
            {
                NSLog(@"we dont know which direction this session is supposed to be used");
                ougoingPeerName = @"dropped";
            }
        }
        else
        if(nextHop==NULL)
        {
            
            UMDiameterRoute *route=NULL;
            UMDiameterAvpFTSRouteSelector *routeSelect = (UMDiameterAvpFTSRouteSelector *)[_packet getAvpByCode:[UMDiameterAvpFTSRouteSelector avpCode]];
            if(routeSelect)
            {
                NSNumber *n = [routeSelect numberValue];
                if(n)
                {
                    route = [_router findRouteForRouteSelector:n];
                }
            }
            if(route==NULL)
            {
                route = [_router findRouteForRealm:_realm];
            }
            if(route==NULL)
            {
                route = [_router findRouteForHost:_host];
                if(route==NULL)
                {
                    route = [_router findRouteForDefault];
                }
            }
            if(route.peer)
            {
                nextHop = route.peer;
                ougoingPeerName = nextHop.layerName;
            }
            else if(route.destination)
            {
                nextHop = [_router findPeer:route.destination];
                route.peer = nextHop;
                ougoingPeerName = nextHop.layerName;
            }
        }
        if(nextHop==NULL)
        {
            NSLog(@"No route found for realm %@ host %@",_realm,_host);
            ougoingPeerName = @"no-route-found";
            if(_router.logLevel <= UMLOG_DEBUG)
            {
                [_router dumpRoutes];
            }
        }
        else
        {
            if(isRequest)
            {
                if(_session == NULL)
                {
                    _session = [[UMDiameterRouterSession alloc]init];
                    _session.initiator = _sender;
                    if(_sender == NULL)
                    {
                        _session.initiator_is_local = YES;
                    }
                    _session.initiator_hop_by_hop_identifier = _packet.hopByHopIdentifier;
                    _session.initiator_end_to_end_identifier = _packet.endToEndIdentifier;
                    _session.responder = nextHop;
                    _packet.hopByHopIdentifier = [nextHop nextHopByHopIdentifier];
                    _session.responder_hop_by_hop_identifier = _packet.hopByHopIdentifier;
                    _session.responder_end_to_end_identifier = _packet.endToEndIdentifier;
                    [_router addSession:_session];
                    [nextHop sendMessage:_packet];
                }
                else
                {
                    NSString *s = [NSString stringWithFormat:@"Dropping request packed for an existing session: %@ / %@\n",_session.sid1,_session.sid2];
                    [_router logMinorError:s];
                }
            }
            else /* its a response */
            {
                if(_session==NULL)
                {
                    NSString *s = [NSString stringWithFormat:@"Dropping response packed from %@ for a unknown hop-by-hop 0x%08x end-to-end 0x%08x",
                    _sender.layerName,_packet.hopByHopIdentifier,_packet.endToEndIdentifier ];
                    [_router logMinorError:s];
                }
                else
                {
                    _packet.hopByHopIdentifier = _session.initiator_hop_by_hop_identifier;
                    [nextHop sendMessage:_packet];
                    [_router removeSession:_session];
                }
            }
        }
        [_router addPacketStatistic:_packet
                       incomingPeer:_sender.layerName
                       outgoingPeer:ougoingPeerName];
    }
}

@end
