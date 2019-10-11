//
//  UMDiameterAvpServed_Party_IP_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServed_Party_IP_Address.h"

@implementation UMDiameterAvpServed_Party_IP_Address


- (NSString *)avpType
{
    return @"Served-Party-IP-Address";
}

- (uint32_t)avpCode
{
    return 848;
}

+ (uint32_t)avpCode
{
    return 848;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

