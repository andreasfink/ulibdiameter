//
//  UMDiameterAvpFTSRouteSelector.m
//  ulibdiameter
//
//  Created by afink on 2021-03-01 06:28:46.737359
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFTSRouteSelector.h"

@implementation UMDiameterAvpFTSRouteSelector


- (NSString *)avpType
{
    return @"FTSRouteSelector";
}

- (uint32_t)avpCode
{
    return 4609107;
}

+ (uint32_t)avpCode
{
    return 4609107;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ftsrouteselector";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

