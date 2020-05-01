//
//  UMDiameterAvpPrimary_Event_Charging_Function_Name.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPrimary_Event_Charging_Function_Name.h"

@implementation UMDiameterAvpPrimary_Event_Charging_Function_Name


- (NSString *)avpType
{
    return @"Primary-Event-Charging-Function-Name";
}

- (uint32_t)avpCode
{
    return 619;
}

+ (uint32_t)avpCode
{
    return 619;
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
    avpDef[@"name"] = @"primary-event-charging-function-name";
    avpDef[@"type"] = @"DiameterURI";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

