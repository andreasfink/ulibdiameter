//
//  UMDiameterAvpRedirectHost.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpRedirectHost.h"

@implementation UMDiameterAvpRedirectHost



- (NSString *)avpType
{
    return @"RedirectHost";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_RedirectHost;
}


@end
