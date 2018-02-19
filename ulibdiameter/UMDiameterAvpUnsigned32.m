//
//  UMDiameterAvpUnsigned32.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpUnsigned32

- (void)afterDecode
{
    if(_avpData.length != 4)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Unsigned32 Packet length is not 4" userInfo:NULL]);
    }
    const uint8_t *bytes = _avpData.bytes;
    _value =    (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | (bytes[3] << 0);
}

- (void)beforeEncode
{
    uint8_t bytes[4];
    
    bytes[0] = _value & 0xFF000000 >> 24;
    bytes[1] = _value & 0x00FF0000 >> 16;
    bytes[2] = _value & 0x0000FF00 >> 8;
    bytes[3] = _value & 0x000000FF >> 0;
    
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

@end
