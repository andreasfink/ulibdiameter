//
//  UMDiameterAvpAdjacent_Access_Restriction_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpAdjacent_Access_Restriction_Data


- (NSString *)avpType
{
    return @"Adjacent-Access-Restriction-Data";
}

- (uint32_t)avpCode
{
    return 1673;
}

+ (uint32_t)avpCode
{
    return 1673;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

