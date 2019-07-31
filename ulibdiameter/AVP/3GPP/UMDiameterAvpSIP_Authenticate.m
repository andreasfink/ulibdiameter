//
//  UMDiameterAvpSIP_Authenticate.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Authenticate.h"

@implementation UMDiameterAvpSIP_Authenticate


- (NSString *)avpType
{
    return @"SIP-Authenticate";
}

- (uint32_t)avpCode
{
    return 609;
}

+ (uint32_t)avpCode
{
    return 609;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

