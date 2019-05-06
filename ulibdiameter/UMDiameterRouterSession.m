//
//  UMDiameterRouterSession.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouterSession.h"
#import "UMDiameterPeer.h"

@implementation UMDiameterRouterSession


- (UMDiameterRouterSession *)init
{
    return [self initWithTimeout:90.0];
}

- (UMDiameterRouterSession *)initWithTimeout:(NSTimeInterval)timeout
{
    self = [super init];
    if(self)
    {
        _timeout = timeout;
        [self touch];
    }
    return self;
}

- (void)touch
{
    _expires = [NSDate dateWithTimeIntervalSinceNow:_timeout];
}

- (BOOL)isExpired
{
    NSDate *now = [NSDate date];
    if(now > _expires)
    {
        return YES;
    }
    return NO;
}

@end
