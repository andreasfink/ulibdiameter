//
//  UMDiameterAvpLocation_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocation_Area_Identity.h"

@implementation UMDiameterAvpLocation_Area_Identity


- (NSString *)avpType
{
    return @"Location-Area-Identity";
}

- (uint32_t)avpCode
{
    return 1606;
}

+ (uint32_t)avpCode
{
    return 1606;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

