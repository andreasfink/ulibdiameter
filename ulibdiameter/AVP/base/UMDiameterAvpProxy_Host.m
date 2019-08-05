//
//  UMDiameterAvpProxy_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.821000
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

