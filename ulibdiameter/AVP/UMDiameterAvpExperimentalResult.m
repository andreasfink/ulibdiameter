//
//  UMDiameterAvpExperimentalResult.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpExperimentalResult.h"

@implementation UMDiameterAvpExperimentalResult

- (NSString *)avpType
{
    return @"ExperimentalResult";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ExperimentalResult;
}


@end
