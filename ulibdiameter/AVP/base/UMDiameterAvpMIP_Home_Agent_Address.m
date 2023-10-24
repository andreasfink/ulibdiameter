//
//  UMDiameterAvpMIP_Home_Agent_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Home_Agent_Address.h"

@implementation UMDiameterAvpMIP_Home_Agent_Address


- (NSString *)avpType
{
    return @"MIP-Home-Agent-Address";
}

- (uint32_t)avpCode
{
    return 334;
}

+ (uint32_t)avpCode
{
    return 334;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-home-agent-address";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

