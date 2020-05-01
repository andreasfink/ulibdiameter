//
//  UMDiameterAvpSMS_GMSC_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSMS_GMSC_Address.h"

@implementation UMDiameterAvpSMS_GMSC_Address


- (NSString *)avpType
{
    return @"SMS-GMSC-Address";
}

- (uint32_t)avpCode
{
    return 3332;
}

+ (uint32_t)avpCode
{
    return 3332;
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
    avpDef[@"name"] = @"sms-gmsc-address";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

