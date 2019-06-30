//
//  UMDiameterAvpAuthApplicationId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthApplicationId.h"

@implementation UMDiameterAvpAuthApplicationId


- (NSString *)avpType
{
    return @"AuthApplicationId";
}

+ (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthApplicationId;
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthApplicationId;
}

- (UMDiameterAvpAuthApplicationId *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        [self setString:str];
    }
    return self;
}

- (NSString *)string
{
    switch(_value)
    {
        case UMDiameterVendorId_3GPPP2:
            return @"3GPPP2";
        case UMDiameterVendorId_3GPP:
            return @"3GPP";
        case UMDiameterVendorId_ETSI:
            return @"ETSI";
        case UMDiameterVendorId_FinkTelecomServices:
            return @"FinkTelecomServices";
        default:
            return [NSString stringWithFormat:@"%lu",(unsigned long)_value];
    }
}

- (void)setString:(NSString *)s
{
    if ([s isEqualToString:@"3GPPP2"])
    {
        _value = UMDiameterVendorId_3GPPP2;
    }
    else if ([s isEqualToString:@"3GPP"])
    {
        _value = UMDiameterVendorId_3GPP;
    }
    else if ([s isEqualToString:@"ETSI"])
    {
        _value = UMDiameterVendorId_ETSI;
    }
    else if ([s isEqualToString:@"FinkTelecomServices"])
    {
        _value = UMDiameterVendorId_FinkTelecomServices;
    }
    else
    {
        _value = (uint32_t)atoll(s.UTF8String);
    }
}
@end
