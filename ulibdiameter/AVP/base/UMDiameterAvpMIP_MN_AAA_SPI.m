//
//  UMDiameterAvpMIP_MN_AAA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
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

