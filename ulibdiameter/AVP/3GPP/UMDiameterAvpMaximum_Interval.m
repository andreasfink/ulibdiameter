//
//  UMDiameterAvpMaximum_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_Interval.h"

@implementation UMDiameterAvpMaximum_Interval


- (NSString *)avpType
{
    return @"Maximum-Interval";
}

- (uint32_t)avpCode
{
    return 2561;
}

+ (uint32_t)avpCode
{
    return 2561;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

