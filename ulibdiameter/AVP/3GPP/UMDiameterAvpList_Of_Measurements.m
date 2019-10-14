//
//  UMDiameterAvpList_Of_Measurements.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpList_Of_Measurements.h"

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


@end

