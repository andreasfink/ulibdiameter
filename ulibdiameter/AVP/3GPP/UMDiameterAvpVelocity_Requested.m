//
//  UMDiameterAvpVelocity_Requested.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVelocity_Requested.h"

@implementation UMDiameterAvpVelocity_Requested


- (NSString *)avpType
{
    return @"Velocity-Requested";
}

- (uint32_t)avpCode
{
    return 2508;
}

+ (uint32_t)avpCode
{
    return 2508;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

