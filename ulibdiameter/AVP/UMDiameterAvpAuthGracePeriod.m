//
//  UMDiameterAvpAuthGracePeriod.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthGracePeriod.h"

@implementation UMDiameterAvpAuthGracePeriod


- (NSString *)avpType
{
    return @"AuthGracePeriod";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthGracePeriod;
}

@end
