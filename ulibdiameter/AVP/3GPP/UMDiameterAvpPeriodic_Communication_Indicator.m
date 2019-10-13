//
//  UMDiameterAvpPeriodic_Communication_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPeriodic_Communication_Indicator.h"

@implementation UMDiameterAvpPeriodic_Communication_Indicator


- (NSString *)avpType
{
    return @"Periodic-Communication-Indicator";
}

- (uint32_t)avpCode
{
    return 3115;
}

+ (uint32_t)avpCode
{
    return 3115;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

