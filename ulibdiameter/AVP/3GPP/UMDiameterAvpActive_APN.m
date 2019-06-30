//
//  UMDiameterAvpActive_APN.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpActive_APN


- (NSString *)avpType
{
    return @"Active-APN";
}

- (uint32_t)avpCode
{
    return 1612;
}

+ (uint32_t)avpCode
{
    return 1612;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

