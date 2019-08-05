//
//  UMDiameterAvpDay_Of_Week_Mask.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDay_Of_Week_Mask.h"

@implementation UMDiameterAvpDay_Of_Week_Mask


- (NSString *)avpType
{
    return @"Day-Of-Week-Mask";
}

- (uint32_t)avpCode
{
    return 563;
}

+ (uint32_t)avpCode
{
    return 563;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

