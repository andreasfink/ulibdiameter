//
//  UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause.h"

@implementation UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause


- (NSString *)avpType
{
    return @"SM-Enumerated-Delivery-Failure-Cause";
}

- (uint32_t)avpCode
{
    return 3304;
}

+ (uint32_t)avpCode
{
    return 3304;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sm-enumerated-delivery-failure-cause";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

