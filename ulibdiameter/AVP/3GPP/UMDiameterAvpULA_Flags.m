//
//  UMDiameterAvpULA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpULA_Flags.h"

@implementation UMDiameterAvpULA_Flags


- (NSString *)avpType
{
    return @"ULA-Flags";
}

- (uint32_t)avpCode
{
    return 1406;
}

+ (uint32_t)avpCode
{
    return 1406;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

