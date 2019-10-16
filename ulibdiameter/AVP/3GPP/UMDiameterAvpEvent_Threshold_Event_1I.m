//
//  UMDiameterAvpEvent_Threshold_Event_1I.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_Event_1I.h"

@implementation UMDiameterAvpEvent_Threshold_Event_1I


- (NSString *)avpType
{
    return @"Event-Threshold-Event-1I";
}

- (uint32_t)avpCode
{
    return 1662;
}

+ (uint32_t)avpCode
{
    return 1662;
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
    avpDef[@"name"] = @"event-threshold-event-1i";
    avpDef[@"type"] = @"Integer32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

