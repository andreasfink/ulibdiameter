//
//  UMDiameterAvpEvent_Threshold_RSRP.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_RSRP.h"

@implementation UMDiameterAvpEvent_Threshold_RSRP


- (NSString *)avpType
{
    return @"Event-Threshold-RSRP";
}

- (uint32_t)avpCode
{
    return 1629;
}

+ (uint32_t)avpCode
{
    return 1629;
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
    avpDef[@"name"] = @"event-threshold-rsrp";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

