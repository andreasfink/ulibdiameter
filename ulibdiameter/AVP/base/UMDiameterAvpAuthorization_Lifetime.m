//
//  UMDiameterAvpAuthorization_Lifetime.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:00:34.245000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuthorization_Lifetime.h"

@implementation UMDiameterAvpAuthorization_Lifetime


- (NSString *)avpType
{
    return @"Authorization-Lifetime";
}

- (uint32_t)avpCode
{
    return 291;
}

+ (uint32_t)avpCode
{
    return 291;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

