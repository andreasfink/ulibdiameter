//
//  UMDiameterAvpICS_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpICS_Indicator


- (NSString *)avpType
{
    return @"ICS-Indicator";
}

- (uint32_t)avpCode
{
    return 1491;
}

+ (uint32_t)avpCode
{
    return 1491;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

