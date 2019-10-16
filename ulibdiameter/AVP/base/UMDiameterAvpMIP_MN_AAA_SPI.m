//
//  UMDiameterAvpMIP_MN_AAA_SPI.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:00.964000
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

