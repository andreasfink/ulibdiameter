//
//  UMDiameterAvpOriginHost.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOriginHost.h"

@implementation UMDiameterAvpOriginHost


- (NSString *)avpType
{
    return @"OriginHost";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_OriginHost;
}


@end
