//
//  UMDiameterAvpAuthLifetime.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthorizationLifetime.h"

@implementation UMDiameterAvpAuthorizationLifetime

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthorizationLifetime;
}

@end
