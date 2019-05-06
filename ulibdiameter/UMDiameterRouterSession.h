//
//  UMDiameterRouterSession.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;

@interface UMDiameterRouterSession : UMObject
{
    UMDiameterPeer *_initiator;
    UMDiameterPeer *_responder;
    NSTimeInterval  _timeout;
    NSDate          *_expires;
}

@property(readwrite,strong,atomic)  UMDiameterPeer *initiator;
@property(readwrite,strong,atomic)  UMDiameterPeer *responder;
@property(readwrite,assign,atomic)  NSTimeInterval timeout;
@property(readwrite,strong,atomic)  NSDate *expires;

- (UMDiameterRouterSession *)init;
- (UMDiameterRouterSession *)initWithTimeout:(NSTimeInterval)timeout;

- (void)touch;
- (BOOL)isExpired;

@end


