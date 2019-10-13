//
//  UMDiameterAvpSampling_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
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

