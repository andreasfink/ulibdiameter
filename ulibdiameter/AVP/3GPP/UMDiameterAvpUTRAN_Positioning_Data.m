//
//  UMDiameterAvpUTRAN_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Positioning_Data.h"

@implementation UMDiameterAvpUTRAN_Positioning_Data


- (NSString *)avpType
{
    return @"UTRAN-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2528;
}

+ (uint32_t)avpCode
{
    return 2528;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

