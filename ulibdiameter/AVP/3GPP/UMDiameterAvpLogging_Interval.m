//
//  UMDiameterAvpLogging_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLogging_Interval.h"

@implementation UMDiameterAvpLogging_Interval


- (NSString *)avpType
{
    return @"Logging-Interval";
}

- (uint32_t)avpCode
{
    return 1631;
}

+ (uint32_t)avpCode
{
    return 1631;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

