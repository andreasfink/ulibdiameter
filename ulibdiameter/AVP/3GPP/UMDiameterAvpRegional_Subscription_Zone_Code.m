//
//  UMDiameterAvpRegional_Subscription_Zone_Code.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRegional_Subscription_Zone_Code.h"

@implementation UMDiameterAvpRegional_Subscription_Zone_Code


- (NSString *)avpType
{
    return @"Regional-Subscription-Zone-Code";
}

- (uint32_t)avpCode
{
    return 1446;
}

+ (uint32_t)avpCode
{
    return 1446;
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
    avpDef[@"name"] = @"regional-subscription-zone-code";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

