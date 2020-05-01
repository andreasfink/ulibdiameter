//
//  UMDiameterAvpMME_Number_for_MT_SMS.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Number_for_MT_SMS.h"

@implementation UMDiameterAvpMME_Number_for_MT_SMS


- (NSString *)avpType
{
    return @"MME-Number-for-MT-SMS";
}

- (uint32_t)avpCode
{
    return 1645;
}

+ (uint32_t)avpCode
{
    return 1645;
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
    avpDef[@"name"] = @"mme-number-for-mt-sms";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

