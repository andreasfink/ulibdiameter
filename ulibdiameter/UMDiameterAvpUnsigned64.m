//
//  UMDiameterAvpUnsigned64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"

@implementation UMDiameterAvpUnsigned64


- (NSString *)avpType
{
    return @"Unsigned64";
}

- (void)afterDecode
{
    if(_avpData.length != 8)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Unsigned64 Packet length is not 8" userInfo:NULL]);
    }
    _value = (uint64_t)ntohll( *(uint64_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];

    *(uint64_t *)&bytes[0]  = (uint64_t)htonll( (uint64_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}


@end
