//
//  UMDiameterAvpEvent_Threshold_Event_1F.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpEvent_Threshold_Event_1F.h>

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

