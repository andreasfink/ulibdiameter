//
//  UMDiameterAvpUTRAN_Additional_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Additional_Positioning_Data.h"

@implementation UMDiameterAvpUTRAN_Additional_Positioning_Data


- (NSString *)avpType
{
    return @"UTRAN-Additional-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2558;
}

+ (uint32_t)avpCode
{
    return 2558;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

