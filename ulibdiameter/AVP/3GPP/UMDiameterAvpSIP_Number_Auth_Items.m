//
//  UMDiameterAvpSIP_Number_Auth_Items.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Number_Auth_Items.h"

@implementation UMDiameterAvpSIP_Number_Auth_Items


- (NSString *)avpType
{
    return @"SIP-Number-Auth-Items";
}

- (uint32_t)avpCode
{
    return 607;
}

+ (uint32_t)avpCode
{
    return 607;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

