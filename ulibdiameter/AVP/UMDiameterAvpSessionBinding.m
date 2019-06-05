//
//  UMDiameterAvpSessionBinding.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpSessionBinding.h"

@implementation UMDiameterAvpSessionBinding



- (NSString *)avpType
{
    return @"SessionBinding";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SessionBinding;
}


@end
