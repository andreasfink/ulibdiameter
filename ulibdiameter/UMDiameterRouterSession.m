//
//  UMDiameterRouterSession.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouterSession.h"
#import "UMDiameterPeer.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPacketsAll.h"
#import "UMDiameterRouter.h"

@implementation UMDiameterRouterSession


- (UMDiameterRouterSession *)init
{
    return [self initWithTimeout:30.0];
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

- (void)processIncomingPacket:(UMDiameterPacket *)packet forRouter:(UMDiameterRouter *)router fromPeer:(UMDiameterPeer *)peer
{
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
        [router processIncomingRequestPacket:packet fromPeer:peer];
    }
    else if(packet.commandFlags & DIAMETER_COMMAND_FLAG_ERROR)
    {
        [router processIncomingErrorPacket:packet fromPeer:peer];

    }
    else
    {
        [router processIncomingResponsePacket:packet fromPeer:peer];
    }
}

- (void)expire
{
    NSLog(@"session %@ - %@ expires",_sid1,_sid2);
    /* FIXME */
}

@end
