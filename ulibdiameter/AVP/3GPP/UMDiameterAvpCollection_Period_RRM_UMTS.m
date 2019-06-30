//
//  UMDiameterAvpCollection_Period_RRM_UMTS.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpCollection_Period_RRM_UMTS


- (NSString *)avpType
{
    return @"Collection-Period-RRM-UMTS";
}

- (uint32_t)avpCode
{
    return 1658;
}

+ (uint32_t)avpCode
{
    return 1658;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

