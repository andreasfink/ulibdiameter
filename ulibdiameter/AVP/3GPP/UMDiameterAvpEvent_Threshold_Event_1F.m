//
//  UMDiameterAvpEvent_Threshold_Event_1F.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_Event_1F.h"

@implementation UMDiameterAvpEvent_Threshold_Event_1F


- (NSString *)avpType
{
    return @"Event-Threshold-Event-1F";
}

- (uint32_t)avpCode
{
    return 1661;
}

+ (uint32_t)avpCode
{
    return 1661;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 10415 */
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"event-threshold-event-1f";
    avpDef[@"type"] = @"Integer32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

