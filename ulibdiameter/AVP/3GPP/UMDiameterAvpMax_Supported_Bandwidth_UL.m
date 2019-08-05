//
//  UMDiameterAvpMax_Supported_Bandwidth_UL.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Supported_Bandwidth_UL.h"

@implementation UMDiameterAvpMax_Supported_Bandwidth_UL


- (NSString *)avpType
{
    return @"Max-Supported-Bandwidth-UL";
}

- (uint32_t)avpCode
{
    return 544;
}

+ (uint32_t)avpCode
{
    return 544;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

