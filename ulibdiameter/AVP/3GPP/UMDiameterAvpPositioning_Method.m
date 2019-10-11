//
//  UMDiameterAvpPositioning_Method.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPositioning_Method.h"

@implementation UMDiameterAvpPositioning_Method


- (NSString *)avpType
{
    return @"Positioning-Method";
}

- (uint32_t)avpCode
{
    return 1659;
}

+ (uint32_t)avpCode
{
    return 1659;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

