//
//  UMDiameterAvpReport_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpReport_Interval


- (NSString *)avpType
{
    return @"Report-Interval";
}

- (uint32_t)avpCode
{
    return 1627;
}

+ (uint32_t)avpCode
{
    return 1627;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

