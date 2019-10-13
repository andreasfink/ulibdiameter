//
//  UMDiameterAvpGMLC_Restriction.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGMLC_Restriction.h"

@implementation UMDiameterAvpGMLC_Restriction


- (NSString *)avpType
{
    return @"GMLC-Restriction";
}

- (uint32_t)avpCode
{
    return 1481;
}

+ (uint32_t)avpCode
{
    return 1481;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

