//
//  UMDiameterAvpInteger32.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger32.h"
#include <arpa/inet.h>

@implementation UMDiameterAvpInteger32

- (UMDiameterAvpInteger32 *)initWithNumber:(NSNumber *)n
{
    self = [super init];
    if(self)
    {
        [self setNumberValue:n];
    }
    return self;
}

- (UMDiameterAvpInteger32 *)initWithString:(NSString *)s
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
    return @"Integer32";
}

- (void)afterDecode
{
    if(_avpData.length != 4)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Integer32 Packet length is not 4" userInfo:NULL]);
    }
    _value = (int32_t)ntohl( *(int32_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[4];

    *(int32_t *)&bytes[0]  = (int32_t)htonl( (int32_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

- (NSNumber *)numberValue
{
    return [[NSNumber alloc]initWithInt:self.value];
}

- (void)setNumberValue:(NSNumber *)n
{
    self.value = n.intValue;
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




- (uint32_t)dataLength
{
    return 4;
}

- (void)setStringValue:(NSString *)string
{
    self.value = (int32_t)[string longLongValue];
}

- (NSString *)stringValue
{
    return [NSString stringWithFormat:@"%ld",(long)self.value];
}

- (id)objectValue
{
    return @(self.value);
}

@end
