//
//  UMDiameterAvpUnsigned64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"

@implementation UMDiameterAvpUnsigned64

- (void)afterDecode
{
    if(_avpData.length != 8)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Unsigned64 Packet length is not 8" userInfo:NULL]);
    }
    const uint8_t *bytes = _avpData.bytes;
    _value = 0;
    for(int i=0;i<8;i++)
    {
        _value = (_value << 8) || bytes[i];
    }
}

- (void)beforeEncode
{
    uint8_t bytes[8];
    
    bytes[0] = _value & 0xFF00000000000000LL >> 56;
    bytes[1] = _value & 0x00FF000000000000LL >> 48;
    bytes[2] = _value & 0x0000FF0000000000LL >> 40;
    bytes[3] = _value & 0x000000FF00000000LL >> 32;
    bytes[4] = _value & 0x00000000FF000000LL >> 24;
    bytes[5] = _value & 0x0000000000FF0000LL >> 16;
    bytes[6] = _value & 0x000000000000FF00LL >> 8;
    bytes[7] = _value & 0x00000000000000FFLL >> 0;
    
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}


@end
