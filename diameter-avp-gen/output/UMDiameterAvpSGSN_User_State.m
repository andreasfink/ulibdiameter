//
//  UMDiameterAvpSGSN_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpSGSN_User_State


- (NSString *)avpType
{
    return @"SGSN-User-State";
}

- (uint32_t)avpCode
{
    return 1498;
}

+ (uint32_t)avpCode
{
    return 1498;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

