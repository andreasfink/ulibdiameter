//
//  UMDiameterAvpInteger64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger64.h"

@implementation UMDiameterAvpInteger64

- (NSString *)avpType
{
    return @"Integer64";
}

- (void)afterDecode
{
    if(_avpData.length != 8)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Integer64 Packet length is not 8" userInfo:NULL]);
    }
    _value = (int64_t)ntohll( *(int64_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];

    *(int64_t *)&bytes[0]  = (int64_t)htonll( (int64_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

@end
