//
//  UMDiameterAvpProxy_State.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProxy_State.h"

@implementation UMDiameterAvpProxy_State


- (NSString *)avpType
{
    return @"Proxy-State";
}

- (uint32_t)avpCode
{
    return 33;
}

+ (uint32_t)avpCode
{
    return 33;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

