//
//  UMDiameterAvpTime_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTF8String.h"

@implementation UMDiameterAvpTime_Zone


- (NSString *)avpType
{
    return @"Time-Zone";
}

- (uint32_t)avpCode
{
    return 1642;
}

+ (uint32_t)avpCode
{
    return 1642;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

