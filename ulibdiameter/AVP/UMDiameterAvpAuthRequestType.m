//
//  UMDiameterAvpAuthRequestType.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthRequestType.h"

@implementation UMDiameterAvpAuthRequestType


- (NSString *)avpType
{
    return @"AuthRequestType";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthRequestType;
}

@end
