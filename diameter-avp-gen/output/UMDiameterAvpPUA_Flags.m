//
//  UMDiameterAvpPUA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

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

