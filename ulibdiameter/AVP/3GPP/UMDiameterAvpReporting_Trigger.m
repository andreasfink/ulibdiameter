//
//  UMDiameterAvpReporting_Trigger.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Trigger.h"

@implementation UMDiameterAvpReporting_Trigger


- (NSString *)avpType
{
    return @"Reporting-Trigger";
}

- (uint32_t)avpCode
{
    return 1626;
}

+ (uint32_t)avpCode
{
    return 1626;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

