//
//  UMDiameterAvpSMS_GMSC_Alert_Event.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpSMS_GMSC_Alert_Event.h>

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

