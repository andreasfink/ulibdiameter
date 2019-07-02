//
//  UMDiameterAvpServiceTypeIdentity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServiceTypeIdentity.h"

@implementation UMDiameterAvpServiceTypeIdentity


- (NSString *)avpType
{
    return @"ServiceTypeIdentity";
}

- (uint32_t)avpCode
{
    return 1484;
}

+ (uint32_t)avpCode
{
    return 1484;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

