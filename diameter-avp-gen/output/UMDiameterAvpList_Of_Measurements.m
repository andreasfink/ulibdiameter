//
//  UMDiameterAvpList_Of_Measurements.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpList_Of_Measurements


- (NSString *)avpType
{
    return @"List-Of-Measurements";
}

- (uint32_t)avpCode
{
    return 1625;
}

+ (uint32_t)avpCode
{
    return 1625;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

