//
//  UMDiameterAvpSupported_GAD_Shapes.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:46:18.366000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_GAD_Shapes.h"

@implementation UMDiameterAvpSupported_GAD_Shapes


- (NSString *)avpType
{
    return @"Supported-GAD-Shapes";
}

- (uint32_t)avpCode
{
    return 2510;
}

+ (uint32_t)avpCode
{
    return 2510;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

