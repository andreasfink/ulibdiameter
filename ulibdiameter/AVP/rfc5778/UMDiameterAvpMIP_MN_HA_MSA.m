//
//  UMDiameterAvpMIP_MN_HA_MSA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:28:22.488000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MN_HA_MSA.h"

@implementation UMDiameterAvpMIP_MN_HA_MSA


- (NSString *)avpType
{
    return @"MIP-MN-HA-MSA";
}

- (uint32_t)avpCode
{
    return 492;
}

+ (uint32_t)avpCode
{
    return 492;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

