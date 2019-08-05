//
//  UMDiameterAvpRe_Auth_Request_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRe_Auth_Request_Type.h"

@implementation UMDiameterAvpRe_Auth_Request_Type


- (NSString *)avpType
{
    return @"Re-Auth-Request-Type";
}

- (uint32_t)avpCode
{
    return 285;
}

+ (uint32_t)avpCode
{
    return 285;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

