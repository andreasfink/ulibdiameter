//
//  UMDiameterAvpICS_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ics-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

