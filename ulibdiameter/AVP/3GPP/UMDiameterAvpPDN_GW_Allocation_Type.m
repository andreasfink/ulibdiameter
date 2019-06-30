//
//  UMDiameterAvpPDN_GW_Allocation_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpPDN_GW_Allocation_Type


- (NSString *)avpType
{
    return @"PDN-GW-Allocation-Type";
}

- (uint32_t)avpCode
{
    return 1438;
}

+ (uint32_t)avpCode
{
    return 1438;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

