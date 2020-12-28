//
//  UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
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
    /* _vendorFlag = YES, _vendorCode = 10415 */
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

