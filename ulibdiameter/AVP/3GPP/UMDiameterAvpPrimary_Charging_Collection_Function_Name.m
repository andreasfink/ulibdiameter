//
//  UMDiameterAvpPrimary_Charging_Collection_Function_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPrimary_Charging_Collection_Function_Name.h"

@implementation UMDiameterAvpPrimary_Charging_Collection_Function_Name


- (NSString *)avpType
{
    return @"Primary-Charging-Collection-Function-Name";
}

- (uint32_t)avpCode
{
    return 621;
}

+ (uint32_t)avpCode
{
    return 621;
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
    avpDef[@"name"] = @"primary-charging-collection-function-name";
    avpDef[@"type"] = @"DiameterURI";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

