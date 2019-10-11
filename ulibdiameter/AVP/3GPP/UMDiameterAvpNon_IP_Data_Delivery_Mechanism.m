//
//  UMDiameterAvpNon_IP_Data_Delivery_Mechanism.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNon_IP_Data_Delivery_Mechanism.h"

@implementation UMDiameterAvpNon_IP_Data_Delivery_Mechanism


- (NSString *)avpType
{
    return @"Non-IP-Data-Delivery-Mechanism";
}

- (uint32_t)avpCode
{
    return 1682;
}

+ (uint32_t)avpCode
{
    return 1682;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

