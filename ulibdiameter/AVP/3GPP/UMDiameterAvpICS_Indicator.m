//
//  UMDiameterAvpICS_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpICS_Indicator.h"

@implementation UMDiameterAvpICS_Indicator


- (NSString *)avpType
{
    return @"ICS-Indicator";
}

- (uint32_t)avpCode
{
    return 1491;
}

+ (uint32_t)avpCode
{
    return 1491;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

