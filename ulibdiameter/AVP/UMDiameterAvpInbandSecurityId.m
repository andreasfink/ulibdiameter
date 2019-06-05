//
//  UMDiameterAvpInbandSecurityId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInbandSecurityId.h"

@implementation UMDiameterAvpInbandSecurityId


- (NSString *)avpType
{
    return @"SecurityId";
}


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_InbandSecurityId;
}


@end
