//
//  UMDiameterAvp3GPP_Charging_Characteristics.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvp3GPP_Charging_Characteristics.h"

@implementation UMDiameterAvp3GPP_Charging_Characteristics


- (NSString *)avpType
{
    return @"3GPP-Charging-Characteristics";
}

- (uint32_t)avpCode
{
    return 13;
}

+ (uint32_t)avpCode
{
    return 13;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

