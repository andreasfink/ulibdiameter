//
//  UMDiameterAvpMIP_MSA_Lifetime.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.283000
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


@end

