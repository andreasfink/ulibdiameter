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

@implementation UMDiameterRouter_RouteTask


- (UMDiameterRouter_RouteTask *)initWithRouter:(UMDiameterRouter *)router
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
        UMDiameterPeer *nextHop=NULL;        
        UMDiameterRouterSession *session = [_router findSessionForPacket:_packet fromPeer:sender];
        BOOL isRequest = _packet.flagRequest;
        if(session)
        {
            /* if we have a session, we use the same route back */
            [session touch];
            if(session.initiator == _sender)
            {
                nextHop = session.responder;
            }
            else if(session.responder == _sender)
            {
                nextHop = session.initiator;
            }
            else
            {
                NSLog(@"we dont know which direction this session is supposed to be used");
            }
        }
        if(nextHop==NULL)
        {
            UMDiameterRoute *route=NULL;
            route = [_router findRouteForRealm:_realm];
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
            }
            else if(route.destination)
            {
                nextHop = [_router findPeer:route.destination];
                route.peer = nextHop;
            }
        }
        if(nextHop==NULL)
        {
            NSLog(@"No route found for realm %@ host %@",_realm,_host);
        }
        else
        {
            if(isRequest)
            {
                if(session == NULL)
                {
                    session = [[UMDiameterRouterSession alloc]init];
                    session.initiator = _sender;
                    session.initiator_hop_by_hop_identifier = _packet.hopByHopIdentifier;
                    session.initiator_end_to_end_identifier = _packet.endToEndIdentifier;
                    session.responder = nextHop;
                    _packet.hopByHopIdentifier = [nextHop nextHopByHopIdentifier];
                    session.responder_hop_by_hop_identifier = _packet.hopByHopIdentifier;
                    session.responder_end_to_end_identifier = _packet.endToEndIdentifier;
                    [_router addSession:session];
                    [nextHop sendMessage:_packet];
                }
                else
                {
                    NSString *s = [NSString stringWithFormat:@"Dropping request packed for an existing session: %@ / %@\n",session.sid1,session.sid2];
                    [_router logMinorError:s];
                }
            }
            else /* its a response */
            {
                if(session==NULL)
                {
                    NSString *s = [NSString stringWithFormat:@"Dropping response packed from %@ for a unknown hop-by-hop 0x%08x end-to-end 0x%08x",
                    _sender.layerName,_packet.hopByHopIdentifier,_packet.endToEndIdentifier ];
                    [_router logMinorError:s];
                }
                else
                {
                    _packet.hopByHopIdentifier = session.initiator_hop_by_hop_identifier;
                    [nextHop sendMessage:_packet];
                    [_router removeSession:session];
                }
            }
        }
        
    }
}

@end
