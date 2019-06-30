//
//  UMDiameterAvpeDRX_Cycle_Length.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpeDRX_Cycle_Length


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length";
}

- (uint32_t)avpCode
{
    return 1691;
}

+ (uint32_t)avpCode
{
    return 1691;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

