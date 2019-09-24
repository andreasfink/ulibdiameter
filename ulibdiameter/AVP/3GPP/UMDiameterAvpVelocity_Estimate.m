//
//  UMDiameterAvpVelocity_Estimate.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVelocity_Estimate.h"

@implementation UMDiameterAvpVelocity_Estimate


- (NSString *)avpType
{
    return @"Velocity-Estimate";
}

- (uint32_t)avpCode
{
    return 2515;
}

+ (uint32_t)avpCode
{
    return 2515;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

