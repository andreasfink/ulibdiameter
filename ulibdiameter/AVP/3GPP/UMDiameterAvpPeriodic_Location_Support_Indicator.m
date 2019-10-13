//
//  UMDiameterAvpPeriodic_Location_Support_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPeriodic_Location_Support_Indicator.h"

@implementation UMDiameterAvpPeriodic_Location_Support_Indicator


- (NSString *)avpType
{
    return @"Periodic-Location-Support-Indicator";
}

- (uint32_t)avpCode
{
    return 2550;
}

+ (uint32_t)avpCode
{
    return 2550;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

