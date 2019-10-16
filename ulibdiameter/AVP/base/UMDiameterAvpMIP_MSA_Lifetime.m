//
//  UMDiameterAvpMIP_MSA_Lifetime.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:00.964000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MSA_Lifetime.h"

@implementation UMDiameterAvpMIP_MSA_Lifetime


- (NSString *)avpType
{
    return @"MIP-MSA-Lifetime";
}

- (uint32_t)avpCode
{
    return 367;
}

+ (uint32_t)avpCode
{
    return 367;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-msa-lifetime";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

