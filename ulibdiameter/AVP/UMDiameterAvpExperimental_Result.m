//
//  UMDiameterAvpExperimental_Result.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpExperimental_Result.h"

@implementation UMDiameterAvpExperimental_Result

- (NSString *)avpType
{
    return @"Experimental-Result";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_Experimental_Result;
}


@end
