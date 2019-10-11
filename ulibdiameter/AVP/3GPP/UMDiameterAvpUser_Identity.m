//
//  UMDiameterAvpUser_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Identity.h"

@implementation UMDiameterAvpUser_Identity


- (NSString *)avpType
{
    return @"User-Identity ";
}

- (uint32_t)avpCode
{
    return 700;
}

+ (uint32_t)avpCode
{
    return 700;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

