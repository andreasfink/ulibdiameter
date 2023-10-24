//
//  UMDiameterAvpFloat32.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpFloat32.h>

@implementation UMDiameterAvpFloat32


- (NSString *)avpType
{
    return @"Float32";
}

- (void)afterDecode
{
    if(_avpData.length != 4)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Float32 Packet length is not 4" userInfo:NULL]);
    }
    _value = (float)ntohl( *(uint32_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[4];
    *(uint32_t *)&bytes[0]  = (float)htonl( (uint32_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

- (NSNumber *)numberValue
{
    return @(_value);
}

- (void)setNumberValue:(NSNumber *)n
{
    self.value = n.floatValue;
}


- (void)setDataValue:(NSData *)data
{
    if(data.length == 4)
    {
        _value = (float)ntohl( *(uint32_t *)data.bytes);
    }
}

- (void)setStringValue:(NSString *)string
{
    _value = [string floatValue];
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
