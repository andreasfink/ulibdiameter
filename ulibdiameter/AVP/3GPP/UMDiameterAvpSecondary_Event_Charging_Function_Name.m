//
//  UMDiameterAvpSecondary_Event_Charging_Function_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSecondary_Event_Charging_Function_Name.h"

@implementation UMDiameterAvpSecondary_Event_Charging_Function_Name


- (NSString *)avpType
{
    return @"Secondary-Event-Charging-Function-Name";
}

- (uint32_t)avpCode
{
    return 620;
}

+ (uint32_t)avpCode
{
    return 620;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

