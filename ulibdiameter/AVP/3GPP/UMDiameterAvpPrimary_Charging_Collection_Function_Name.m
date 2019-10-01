//
//  UMDiameterAvpPrimary_Charging_Collection_Function_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
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


@end

