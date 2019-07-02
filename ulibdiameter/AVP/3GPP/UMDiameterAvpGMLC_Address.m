//
//  UMDiameterAvpGMLC_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGMLC_Address.h"

@implementation UMDiameterAvpGMLC_Address


- (NSString *)avpType
{
    return @"GMLC-Address";
}

- (uint32_t)avpCode
{
    return 2405;
}

+ (uint32_t)avpCode
{
    return 2405;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

