//
//  UMDiameterAvpSIP_Auth_Data_Item.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Auth_Data_Item.h"

@implementation UMDiameterAvpSIP_Auth_Data_Item


- (NSString *)avpType
{
    return @"SIP-Auth-Data-Item";
}

- (uint32_t)avpCode
{
    return 612;
}

+ (uint32_t)avpCode
{
    return 612;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

