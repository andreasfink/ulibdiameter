//
//  UMDiameterAvpMIP_MN_AAA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-mn-aaa-spi";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

