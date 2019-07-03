//
//  UMDiameterAvpNon_IP_PDN_Type_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNon_IP_PDN_Type_Indicator.h"

@implementation UMDiameterAvpNon_IP_PDN_Type_Indicator


- (NSString *)avpType
{
    return @"Non-IP-PDN-Type-Indicator";
}

- (uint32_t)avpCode
{
    return 1681;
}

+ (uint32_t)avpCode
{
    return 1681;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

