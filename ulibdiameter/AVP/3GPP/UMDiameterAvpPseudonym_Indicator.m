//
//  UMDiameterAvpPseudonym_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPseudonym_Indicator.h"

@implementation UMDiameterAvpPseudonym_Indicator


- (NSString *)avpType
{
    return @"Pseudonym-Indicator";
}

- (uint32_t)avpCode
{
    return 2519;
}

+ (uint32_t)avpCode
{
    return 2519;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

