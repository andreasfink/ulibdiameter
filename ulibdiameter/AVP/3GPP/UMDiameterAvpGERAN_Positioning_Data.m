//
//  UMDiameterAvpGERAN_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_Positioning_Data.h"

@implementation UMDiameterAvpGERAN_Positioning_Data


- (NSString *)avpType
{
    return @"GERAN-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2525;
}

+ (uint32_t)avpCode
{
    return 2525;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

