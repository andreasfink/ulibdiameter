//
//  UMDiameterAvpMONTE_Location_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMONTE_Location_Type.h"

@implementation UMDiameterAvpMONTE_Location_Type


- (NSString *)avpType
{
    return @"MONTE-Location-Type";
}

- (uint32_t)avpCode
{
    return 3136;
}

+ (uint32_t)avpCode
{
    return 3136;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

