//
//  UMDiameterAvpDigest_HA1.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDigest_HA1.h"

@implementation UMDiameterAvpDigest_HA1


- (NSString *)avpType
{
    return @"Digest-HA1";
}

- (uint32_t)avpCode
{
    return 121;
}

+ (uint32_t)avpCode
{
    return 121;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

