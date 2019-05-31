//
//  UMDiameterAvpUnsigned64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"

static void uint64_to_bytes8(uint64_t v , uint8_t *bytes);
static uint64_t bytes8_to_uint64_t(const uint8_t *bytes);

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
    _value = bytes8_to_uint64_t(_avpData.bytes);
//    _value = (uint64_t)ntohll( *(uint64_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];
//    *(uint64_t *)&bytes[0]  = (uint64_t)htonll( (uint64_t)_value);
    uint64_to_bytes8(_value,bytes);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

- (NSNumber *)number
{
    return [[NSNumber alloc]initWithUnsignedLongLong:self.value];
}

- (void)setNumber:(NSNumber *)n
{
    self.value = n.unsignedLongLongValue;
}

- (uint32_t)dataLength
{
    return 8;
}

@end


static void uint64_to_bytes8(uint64_t v , uint8_t *bytes)
{
    bytes[0] = (v >>  0)  & 0xFF;
    bytes[1] = (v >>  8)  & 0xFF;
    bytes[2] = (v >> 16) & 0xFF;
    bytes[3] = (v >> 24) & 0xFF;
    bytes[4] = (v >> 32) & 0xFF;
    bytes[5] = (v >> 40) & 0xFF;
    bytes[6] = (v >> 48) & 0xFF;
    bytes[7] = (v >> 52) & 0xFF;
}

static uint64_t bytes8_to_uint64_t(const uint8_t *bytes)
{
    uint64_t v = ((uint64_t)bytes[0] << 0)
        | ((uint64_t)bytes[1] << 8)
        | ((uint64_t)bytes[2] << 16)
        | ((uint64_t)bytes[3] << 24)
        | ((uint64_t)bytes[4] << 32)
        | ((uint64_t)bytes[5] << 40)
        | ((uint64_t)bytes[6] << 48)
        | ((uint64_t)bytes[7] << 52);
    return v;
}

