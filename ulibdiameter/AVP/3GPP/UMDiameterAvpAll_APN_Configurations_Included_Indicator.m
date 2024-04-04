//
//  UMDiameterAvpAll_APN_Configurations_Included_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpAll_APN_Configurations_Included_Indicator.h>

@implementation UMDiameterAvpAll_APN_Configurations_Included_Indicator


- (NSString *)avpType
{
    return @"All-APN-Configurations-Included-Indicator";
}

- (uint32_t)avpCode
{
    return 1428;
}

+ (uint32_t)avpCode
{
    return 1428;
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
    avpDef[@"name"] = @"all-apn-configurations-included-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

