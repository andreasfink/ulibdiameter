//
//  UMDiameterAvpAuthApplicationId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthApplicationId.h"

@implementation UMDiameterAvpAuthApplicationId


- (NSString *)avpType
{
    return @"AuthApplicationId";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthApplicationId;
}

@end
