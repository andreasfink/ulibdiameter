//
//  UMDiameterAvpMIP_MN_AAA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:50:57.979000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MN_AAA_SPI.h"

@implementation UMDiameterAvpMIP_MN_AAA_SPI


- (NSString *)avpType
{
    return @"MIP-MN-AAA-SPI";
}

- (uint32_t)avpCode
{
    return 341;
}

+ (uint32_t)avpCode
{
    return 341;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

