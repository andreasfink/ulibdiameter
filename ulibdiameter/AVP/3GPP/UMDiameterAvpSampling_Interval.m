//
//  UMDiameterAvpSampling_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSampling_Interval.h"

@implementation UMDiameterAvpSampling_Interval


- (NSString *)avpType
{
    return @"Sampling-Interval";
}

- (uint32_t)avpCode
{
    return 2562;
}

+ (uint32_t)avpCode
{
    return 2562;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

