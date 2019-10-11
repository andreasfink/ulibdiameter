//
//  UMDiameterAvpUTRAN_GANSS_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_GANSS_Positioning_Data.h"

@implementation UMDiameterAvpUTRAN_GANSS_Positioning_Data


- (NSString *)avpType
{
    return @"UTRAN-GANSS-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2529;
}

+ (uint32_t)avpCode
{
    return 2529;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

