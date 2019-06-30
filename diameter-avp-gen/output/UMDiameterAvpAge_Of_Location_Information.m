//
//  UMDiameterAvpAge_Of_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpAge_Of_Location_Information


- (NSString *)avpType
{
    return @"Age-Of-Location-Information";
}

- (uint32_t)avpCode
{
    return 1611;
}

+ (uint32_t)avpCode
{
    return 1611;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

