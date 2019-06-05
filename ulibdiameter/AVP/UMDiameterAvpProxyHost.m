//
//  UMDiameterAvpProxyHost.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpProxyHost.h"

@implementation UMDiameterAvpProxyHost



- (NSString *)avpType
{
    return @"ProxyHost";
}


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ProxyHost;
}


@end
