//
//  UMDiameterAvpTime_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTime_Zone.h"

@implementation UMDiameterAvpTime_Zone


- (NSString *)avpType
{
    return @"Time-Zone";
}

- (uint32_t)avpCode
{
    return 1642;
}

+ (uint32_t)avpCode
{
    return 1642;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

