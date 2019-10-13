//
//  UMDiameterAvpFramed_IPv6_Prefix.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:50:57.979000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFramed_IPv6_Prefix.h"

@implementation UMDiameterAvpFramed_IPv6_Prefix


- (NSString *)avpType
{
    return @"Framed-IPv6-Prefix";
}

- (uint32_t)avpCode
{
    return 97;
}

+ (uint32_t)avpCode
{
    return 97;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

