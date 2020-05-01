//
//  UMDiameterAvpNon_IP_Data_Delivery_Mechanism.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNon_IP_Data_Delivery_Mechanism.h"

@implementation UMDiameterAvpNon_IP_Data_Delivery_Mechanism


- (NSString *)avpType
{
    return @"Non-IP-Data-Delivery-Mechanism";
}

- (uint32_t)avpCode
{
    return 1682;
}

+ (uint32_t)avpCode
{
    return 1682;
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
    avpDef[@"name"] = @"non-ip-data-delivery-mechanism";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

