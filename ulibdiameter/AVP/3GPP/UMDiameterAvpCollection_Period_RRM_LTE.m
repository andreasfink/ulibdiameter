//
//  UMDiameterAvpCollection_Period_RRM_LTE.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpCollection_Period_RRM_LTE


- (NSString *)avpType
{
    return @"Collection-Period-RRM-LTE";
}

- (uint32_t)avpCode
{
    return 1657;
}

+ (uint32_t)avpCode
{
    return 1657;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

