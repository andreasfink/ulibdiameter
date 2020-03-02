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
    NSString        *_sessionIdentifier;
    UMDiameterPeer  *_initiator;
    UMDiameterPeer  *_responder;
    NSTimeInterval  _timeout;
    NSDate          *_expires;
    BOOL            _isLocal;
}

@property(readwrite,strong,atomic)  NSString *sessionIdentifier;
@property(readwrite,strong,atomic)  UMDiameterRouter *router;
@property(readwrite,strong,atomic)  UMDiameterPeer *initiator;
@property(readwrite,strong,atomic)  UMDiameterPeer *responder;
@property(readwrite,assign,atomic)  NSTimeInterval timeout;
@property(readwrite,strong,atomic)  NSDate *expires;
@property(readwrite,assign,atomic)  BOOL isLocal;


- (UMDiameterRouterSession *)init;
- (UMDiameterRouterSession *)initWithTimeout:(NSTimeInterval)timeout;
- (void)processIncomingPacket:(UMDiameterPacket *)paket forRouter:(UMDiameterRouter *)router fromPeer:(UMDiameterPeer *)peer;

- (void)touch;
- (BOOL)isExpired;
- (void)expire;

@end


