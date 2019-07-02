//
//  UMDiameterAvpPUA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPUA_Flags.h"

@implementation UMDiameterAvpPUA_Flags


- (NSString *)avpType
{
    return @"PUA-Flags";
}

- (uint32_t)avpCode
{
    return 1442;
}

+ (uint32_t)avpCode
{
    return 1442;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

