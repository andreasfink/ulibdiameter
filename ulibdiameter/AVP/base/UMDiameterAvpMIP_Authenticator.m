//
//  UMDiameterAvpMIP_Authenticator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Authenticator.h"

@implementation UMDiameterAvpMIP_Authenticator


- (NSString *)avpType
{
    return @"MIP-Authenticator";
}

- (uint32_t)avpCode
{
    return 488;
}

+ (uint32_t)avpCode
{
    return 488;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

