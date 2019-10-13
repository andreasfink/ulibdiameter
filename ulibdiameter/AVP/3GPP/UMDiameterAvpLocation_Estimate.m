//
//  UMDiameterAvpLocation_Estimate.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocation_Estimate.h"

@implementation UMDiameterAvpLocation_Estimate


- (NSString *)avpType
{
    return @"Location-Estimate";
}

- (uint32_t)avpCode
{
    return 1242;
}

+ (uint32_t)avpCode
{
    return 1242;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

