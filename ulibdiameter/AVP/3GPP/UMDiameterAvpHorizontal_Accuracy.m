//
//  UMDiameterAvpHorizontal_Accuracy.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHorizontal_Accuracy.h"

@implementation UMDiameterAvpHorizontal_Accuracy


- (NSString *)avpType
{
    return @"Horizontal-Accuracy";
}

- (uint32_t)avpCode
{
    return 2505;
}

+ (uint32_t)avpCode
{
    return 2505;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

