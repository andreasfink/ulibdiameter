//
//  UMDiameterAvpAge_Of_Location_Estimate.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAge_Of_Location_Estimate.h"

@implementation UMDiameterAvpAge_Of_Location_Estimate


- (NSString *)avpType
{
    return @"Age-Of-Location-Estimate";
}

- (uint32_t)avpCode
{
    return 2514;
}

+ (uint32_t)avpCode
{
    return 2514;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

