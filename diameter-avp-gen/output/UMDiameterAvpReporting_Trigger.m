//
//  UMDiameterAvpReporting_Trigger.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpReporting_Trigger


- (NSString *)avpType
{
    return @"Reporting-Trigger";
}

- (uint32_t)avpCode
{
    return 1626;
}

+ (uint32_t)avpCode
{
    return 1626;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

