//
//  UMDiameterAvpVPLMN_CSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpVPLMN_CSG_Subscription_Data


- (NSString *)avpType
{
    return @"VPLMN-CSG-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1641;
}

+ (uint32_t)avpCode
{
    return 1641;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

