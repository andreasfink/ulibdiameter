//
//  UMDiameterAvpPeriodic_Location_Support_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPeriodic_Location_Support_Indicator.h"

@implementation UMDiameterAvpPeriodic_Location_Support_Indicator


- (NSString *)avpType
{
    return @"Periodic-Location-Support-Indicator";
}

- (uint32_t)avpCode
{
    return 2550;
}

+ (uint32_t)avpCode
{
    return 2550;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"periodic-location-support-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

