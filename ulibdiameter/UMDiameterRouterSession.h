//
//  UMDiameterRouterSession.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;
@class UMDiameterPacket;
@class UMDiameterRouter;

@interface UMDiameterRouterSession : UMObject
{
    UMDiameterPeer  *_initiator;
    BOOL            _initiator_is_local;
    uint32_t        _initiator_hop_by_hop_identifier;
    uint32_t        _initiator_end_to_end_identifier;

    UMDiameterPeer  *_responder;
    BOOL            _responder_is_local;
    uint32_t        _responder_hop_by_hop_identifier;
    uint32_t        _responder_end_to_end_identifier;

    NSString        *_localSessionIdentifier;
    NSString        *_sessionIdentifier;
    NSTimeInterval  _timeout;
    NSDate          *_expires;
    
    NSString        *_sid1;
    NSString        *_sid2;
}


@property(readwrite,strong,atomic)  UMDiameterPeer      *initiator;
@property(readwrite,assign,atomic)  BOOL                initiator_is_local;
@property(readwrite,assign,atomic)  uint32_t            initiator_hop_by_hop_identifier;
@property(readwrite,assign,atomic)  uint32_t            initiator_end_to_end_identifier;

@property(readwrite,strong,atomic)  UMDiameterPeer      *responder;
@property(readwrite,assign,atomic)  BOOL                responder_is_local;
@property(readwrite,assign,atomic)  uint32_t            responder_hop_by_hop_identifier;
@property(readwrite,assign,atomic)  uint32_t            responder_end_to_end_identifier;

@property(readwrite,strong,atomic)  NSString            *localSessionIdentifier;
@property(readwrite,strong,atomic)  NSString            *sessionIdentifier;
@property(readwrite,strong,atomic)  UMDiameterRouter    *router;
@property(readwrite,assign,atomic)  NSTimeInterval      timeout;
@property(readwrite,strong,atomic)  NSDate              *expires;
@property(readwrite,strong,atomic)  NSString            *sid1;
@property(readwrite,strong,atomic)  NSString            *sid2;


- (UMDiameterRouterSession *)init;
- (UMDiameterRouterSession *)initWithTimeout:(NSTimeInterval)timeout;
- (void)processIncomingPacket:(UMDiameterPacket *)paket
                    forRouter:(UMDiameterRouter *)router
                     fromPeer:(UMDiameterPeer *)peer;

- (void)touch;
- (BOOL)isExpired;
- (void)expire;

@end


