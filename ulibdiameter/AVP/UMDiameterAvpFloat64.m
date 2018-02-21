//
//  UMDiameterAvpFloat64.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpFloat64.h"

/*
 
 [FLOATPOINT]
 Institute of Electrical and Electronics Engineers, "IEEE
 Standard for Binary Floating-Point Arithmetic, ANSI/IEEE
 Standard 754-1985", August 1985.
 */
@implementation UMDiameterAvpFloat64


- (NSString *)avpType
{
    return @"Float64";
}


- (void)afterDecode
{
    if(_avpData.length != 8)
    {
        @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Float64 Packet length is not 8" userInfo:NULL]);
    }
    _value = (double)ntohll( *(uint64_t *)_avpData.bytes);
}

- (void)beforeEncode
{
    uint8_t bytes[8];

    *(uint64_t *)&bytes[0]  = (double)htonll( (uint64_t)_value);
    _avpData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
}

@end
