//
//  UMDiameterAvpReport_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReport_Interval.h"

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


@end

