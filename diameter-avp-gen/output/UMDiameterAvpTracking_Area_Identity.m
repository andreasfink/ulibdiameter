//
//  UMDiameterAvpTracking_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpTracking_Area_Identity


- (NSString *)avpType
{
    return @"Tracking-Area-Identity";
}

- (uint32_t)avpCode
{
    return 1603;
}

+ (uint32_t)avpCode
{
    return 1603;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

