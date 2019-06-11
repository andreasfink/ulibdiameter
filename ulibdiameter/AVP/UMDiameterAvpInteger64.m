//
//  UMDiameterAvpInteger64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger64.h"
#import "UMDiameterNetworkOrder.h"

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
    
    _value = (int64_t)bytes_to_uint64(_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];
    uint64_to_bytes((uint64_t)_value,&bytes[0]);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

- (NSNumber *)number
{
    return [[NSNumber alloc]initWithLongLong:self.value];
}

- (void)setNumber:(NSNumber *)n
{
    self.value = n.unsignedLongLongValue;
}

- (uint32_t)dataLength
{
    return 8;
}

- (void)setStringValue:(NSString *)string
{
    self.value = (int64_t)atoll(string.UTF8String);
}
- (NSString *)stringValue
{
    return [NSString stringWithFormat:@"%lld",(long long)self.value];
}

@end
