//
//  UMDiameterAvpGERAN_GANSS_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_GANSS_Positioning_Data.h"

@implementation UMDiameterAvpGERAN_GANSS_Positioning_Data


- (NSString *)avpType
{
    return @"GERAN-GANSS-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2526;
}

+ (uint32_t)avpCode
{
    return 2526;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

