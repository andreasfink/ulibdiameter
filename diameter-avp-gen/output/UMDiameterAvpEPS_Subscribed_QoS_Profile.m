//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpEPS_Subscribed_QoS_Profile


- (NSString *)avpType
{
    return @"EPS-Subscribed-QoS-Profile";
}

- (uint32_t)avpCode
{
    return 1431;
}

+ (uint32_t)avpCode
{
    return 1431;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

