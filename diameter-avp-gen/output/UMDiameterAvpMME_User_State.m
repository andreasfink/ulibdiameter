//
//  UMDiameterAvpMME_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpMME_User_State


- (NSString *)avpType
{
    return @"MME-User-State";
}

- (uint32_t)avpCode
{
    return 1497;
}

+ (uint32_t)avpCode
{
    return 1497;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

