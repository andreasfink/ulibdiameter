//
//  UMDiameterAvpOC_Reduction_Percentage.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:15.553000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Reduction_Percentage.h"

@implementation UMDiameterAvpOC_Reduction_Percentage


- (NSString *)avpType
{
    return @"OC-Reduction-Percentage";
}

- (uint32_t)avpCode
{
    return 627;
}

+ (uint32_t)avpCode
{
    return 627;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

