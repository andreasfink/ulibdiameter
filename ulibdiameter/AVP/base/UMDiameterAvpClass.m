//
//  UMDiameterAvpClass.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpClass.h"

@implementation UMDiameterAvpClass


- (NSString *)avpType
{
    return @"Class";
}

- (uint32_t)avpCode
{
    return 25;
}

+ (uint32_t)avpCode
{
    return 25;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

