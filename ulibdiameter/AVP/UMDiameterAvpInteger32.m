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

- (NSNumber *)number
{
    return [[NSNumber alloc]initWithInt:self.value];
}

- (void)setNumber:(NSNumber *)n
{
    self.value = n.intValue;
}

- (uint32_t)dataLength
{
    return 4;
}

@end
