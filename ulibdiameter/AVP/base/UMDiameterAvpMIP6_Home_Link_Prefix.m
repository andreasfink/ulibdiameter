//
//  UMDiameterAvpMIP6_Home_Link_Prefix.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 10:29:16.058294
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP6_Home_Link_Prefix.h"

@implementation UMDiameterAvpMIP6_Home_Link_Prefix


- (NSString *)avpType
{
    return @"MIP6-Home-Link-Prefix";
}

- (uint32_t)avpCode
{
    return 125;
}

+ (uint32_t)avpCode
{
    return 125;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip6-home-link-prefix";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

