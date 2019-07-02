//
//  UMDiameterAvpRouting_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRouting_Area_Identity.h"

@implementation UMDiameterAvpRouting_Area_Identity


- (NSString *)avpType
{
    return @"Routing-Area-Identity";
}

- (uint32_t)avpCode
{
    return 1605;
}

+ (uint32_t)avpCode
{
    return 1605;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

