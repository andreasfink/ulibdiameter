//
//  UMDiameterAvpRedirectHostUsage.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpRedirectHostUsage.h"

@implementation UMDiameterAvpRedirectHostUsage

- (NSString *)avpType
{
    return @"RedirectHostUsage";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_RedirectHostUsage;
}


@end
