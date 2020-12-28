//
//  UMDiameterAvpMIP6_Home_Link_Prefix.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
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
    /* _vendorFlag = NO, _vendorCode = 10415 */
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

