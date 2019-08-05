//
//  UMDiameterAvpUVA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUVA_Flags.h"

@implementation UMDiameterAvpUVA_Flags


- (NSString *)avpType
{
    return @"UVA-Flags";
}

- (uint32_t)avpCode
{
    return 1640;
}

+ (uint32_t)avpCode
{
    return 1640;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

