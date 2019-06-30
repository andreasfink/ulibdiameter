//
//  UMDiameterAvpSpecific_APN_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpSpecific_APN_Info


- (NSString *)avpType
{
    return @"Specific-APN-Info";
}

- (uint32_t)avpCode
{
    return 1472;
}

+ (uint32_t)avpCode
{
    return 1472;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

