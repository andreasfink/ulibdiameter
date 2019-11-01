//
//  UMDiameterAvpSupported_Monitoring_Events.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Monitoring_Events.h"

@implementation UMDiameterAvpSupported_Monitoring_Events


- (NSString *)avpType
{
    return @"Supported-Monitoring-Events";
}

- (uint32_t)avpCode
{
    return 3144;
}

+ (uint32_t)avpCode
{
    return 3144;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"supported-monitoring-events";
    avpDef[@"type"] = @"Unsigned64";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

