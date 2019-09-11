//
//  UMDiameterAvpDigest_Algorithm.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDigest_Algorithm.h"

@implementation UMDiameterAvpDigest_Algorithm


- (NSString *)avpType
{
    return @"Digest-Algorithm";
}

- (uint32_t)avpCode
{
    return 111;
}

+ (uint32_t)avpCode
{
    return 111;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

