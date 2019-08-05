//
//  UMDiameterAvpMIP6_Auth_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP6_Auth_Mode.h"

@implementation UMDiameterAvpMIP6_Auth_Mode


- (NSString *)avpType
{
    return @"MIP6-Auth-Mode";
}

- (uint32_t)avpCode
{
    return 494;
}

+ (uint32_t)avpCode
{
    return 494;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

