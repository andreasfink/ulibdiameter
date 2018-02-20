//
//  UMDiameterAvpUnsigned32.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpUnsigned32


- (NSString *)avpType
{
    return @"Unsigned32";
}

- (void)afterDecode
{
    if(_avpData.length != 4)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Unsigned32 Packet length is not 4" userInfo:NULL]);
    }
    _value = (uint32_t)ntohl( *(uint32_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[4];

    *(uint32_t *)&bytes[0]  = (uint32_t)htonl( (uint32_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

@end
