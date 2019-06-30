//
//  UMDiameterAvpV2X_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpV2X_Subscription_Data


- (NSString *)avpType
{
    return @"V2X-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1688;
}

+ (uint32_t)avpCode
{
    return 1688;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

