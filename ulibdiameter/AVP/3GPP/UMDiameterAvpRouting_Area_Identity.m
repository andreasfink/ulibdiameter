//
//  UMDiameterAvpRouting_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

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

