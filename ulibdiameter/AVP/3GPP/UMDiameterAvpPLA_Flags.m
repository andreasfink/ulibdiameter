//
//  UMDiameterAvpPLA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPLA_Flags.h"

@implementation UMDiameterAvpPLA_Flags


- (NSString *)avpType
{
    return @"PLA-Flags";
}

- (uint32_t)avpCode
{
    return 2546;
}

+ (uint32_t)avpCode
{
    return 2546;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

