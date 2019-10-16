//
//  UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.h"

@implementation UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer


- (NSString *)avpType
{
    return @"Subscribed-Periodic-RAU-TAU-Timer";
}

- (uint32_t)avpCode
{
    return 1619;
}

+ (uint32_t)avpCode
{
    return 1619;
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
    avpDef[@"name"] = @"subscribed-periodic-rau-tau-timer";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

