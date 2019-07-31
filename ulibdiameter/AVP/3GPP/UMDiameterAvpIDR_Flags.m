//
//  UMDiameterAvpIDR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.459000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIDR_Flags.h"

@implementation UMDiameterAvpIDR_Flags


- (NSString *)avpType
{
    return @"IDR-Flags";
}

- (uint32_t)avpCode
{
    return 1490;
}

+ (uint32_t)avpCode
{
    return 1490;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

