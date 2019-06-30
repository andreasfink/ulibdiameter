//
//  UMDiameterAvpAPN_Configuration_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpAPN_Configuration_Profile


- (NSString *)avpType
{
    return @"APN-Configuration-Profile";
}

- (uint32_t)avpCode
{
    return 1429;
}

+ (uint32_t)avpCode
{
    return 1429;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

