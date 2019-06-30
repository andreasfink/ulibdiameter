//
//  UMDiameterAvpLocal_Time_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpLocal_Time_Zone


- (NSString *)avpType
{
    return @"Local-Time-Zone";
}

- (uint32_t)avpCode
{
    return 1649;
}

+ (uint32_t)avpCode
{
    return 1649;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

