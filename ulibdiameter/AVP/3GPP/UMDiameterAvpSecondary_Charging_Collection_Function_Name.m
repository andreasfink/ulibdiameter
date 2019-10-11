//
//  UMDiameterAvpSecondary_Charging_Collection_Function_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSecondary_Charging_Collection_Function_Name.h"

@implementation UMDiameterAvpSecondary_Charging_Collection_Function_Name


- (NSString *)avpType
{
    return @"Secondary-Charging-Collection-Function-Name";
}

- (uint32_t)avpCode
{
    return 622;
}

+ (uint32_t)avpCode
{
    return 622;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

