//
//  UMDiameterAvpProxy_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProxy_Host.h"

@implementation UMDiameterAvpProxy_Host


- (NSString *)avpType
{
    return @"Proxy-Host";
}

- (uint32_t)avpCode
{
    return 280;
}

+ (uint32_t)avpCode
{
    return 280;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

