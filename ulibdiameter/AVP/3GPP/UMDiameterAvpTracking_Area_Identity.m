//
//  UMDiameterAvpTracking_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTracking_Area_Identity.h"

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


@end

