//
//  UMDiameterAvpAdjacent_PLMNs.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpAdjacent_PLMNs


- (NSString *)avpType
{
    return @"Adjacent-PLMNs";
}

- (uint32_t)avpCode
{
    return 1672;
}

+ (uint32_t)avpCode
{
    return 1672;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

