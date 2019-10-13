//
//  UMDiameterAvpICS_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
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

