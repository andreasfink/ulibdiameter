//
//  UMDiameterAvpPseudonym_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
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

