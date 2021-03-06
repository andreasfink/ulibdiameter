//
//  UMDiameterAvpUnsigned64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"

#import "UMDiameterNetworkOrder.h"

@implementation UMDiameterAvpUnsigned64


- (UMDiameterAvpUnsigned64 *)initWithNumber:(NSNumber *)n
{
    self = [super init];
    if(self)
    {
        [self setNumberValue:n];
    }
    return self;
}

- (UMDiameterAvpUnsigned64 *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        [self setStringValue:s];
    }
    return self;
}

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
    _value = bytes_to_uint64(_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];
    uint64_to_bytes((uint64_t)_value,&bytes[0]);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

- (NSNumber *)numberValue
{
    return [[NSNumber alloc]initWithUnsignedLongLong:self.value];
}

- (void)setNumberValue:(NSNumber *)n
{
    self.value = n.unsignedLongLongValue;
}

- (uint32_t)dataLength
{
    return 8;
}


- (void)setDataValue:(NSData *)data
{
}


- (void)setDictionaryValue:(NSDictionary *)dict
{
}

- (void)setDateValue:(NSDate *)date
{
}


- (void)setStringValue:(NSString *)string
{
    self.value = (uint64_t)atoll(string.UTF8String);
}
- (NSString *)stringValue
{
    return [NSString stringWithFormat:@"%llu",(unsigned long long)self.value];
}

- (id)objectValue
{
    return @(self.value);
}

@end



