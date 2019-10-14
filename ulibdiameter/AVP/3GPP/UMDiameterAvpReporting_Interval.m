//
//  UMDiameterAvpReporting_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Interval.h"

@implementation UMDiameterAvpReporting_Interval


- (NSString *)avpType
{
    return @"Reporting-Interval";
}

- (uint32_t)avpCode
{
    return 2542;
}

+ (uint32_t)avpCode
{
    return 2542;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

