//
//  UMDiameterAvpMaximum_UE_Availability_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_UE_Availability_Time.h"

@implementation UMDiameterAvpMaximum_UE_Availability_Time


- (NSString *)avpType
{
    return @"Maximum-UE-Availability-Time";
}

- (uint32_t)avpCode
{
    return 3329;
}

+ (uint32_t)avpCode
{
    return 3329;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

