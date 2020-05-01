//
//  UMDiameterAvpSMS_GMSC_Alert_Event.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSMS_GMSC_Alert_Event.h"

@implementation UMDiameterAvpSMS_GMSC_Alert_Event


- (NSString *)avpType
{
    return @"SMS-GMSC-Alert-Event";
}

- (uint32_t)avpCode
{
    return 3333;
}

+ (uint32_t)avpCode
{
    return 3333;
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
    avpDef[@"name"] = @"sms-gmsc-alert-event";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

