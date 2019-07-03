//
//  UMDiameterAvpMIP_MN_HA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MN_HA_SPI.h"

@implementation UMDiameterAvpMIP_MN_HA_SPI


- (NSString *)avpType
{
    return @"MIP-MN-HA-SPI";
}

- (uint32_t)avpCode
{
    return 491;
}

+ (uint32_t)avpCode
{
    return 491;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end
