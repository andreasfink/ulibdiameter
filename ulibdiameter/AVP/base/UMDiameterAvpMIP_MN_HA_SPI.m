//
//  UMDiameterAvpMIP_MN_HA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-mn-ha-spi";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

