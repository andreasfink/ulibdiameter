//
//  UMDiameterAvpInteger64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpInteger64.h>
#import <ulibdiameter/UMDiameterNetworkOrder.h>

@implementation UMDiameterAvpInteger64

- (UMDiameterAvpInteger64 *)initWithNumber:(NSNumber *)n
{
    self = [super init];
    if(self)
    {
        [self setNumberValue:n];
    }
    return self;
}

- (UMDiameterAvpInteger64 *)initWithString:(NSString *)s
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

- (NSNumber *)numberValue
{
    return [[NSNumber alloc]initWithLongLong:self.value];
}

- (void)setNumberValue:(NSNumber *)n
{
    self.value = n.longLongValue;
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




- (void)setDataValue:(NSData *)data
{
}


- (void)setDictionaryValue:(NSDictionary *)dict
{
}

- (void)setDateValue:(NSDate *)date
{
}


- (id)objectValue
{
    return @(self.value);
}


@end
