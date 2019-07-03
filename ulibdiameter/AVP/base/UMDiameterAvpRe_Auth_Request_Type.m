//
//  UMDiameterAvpRe_Auth_Request_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:49:36.549000
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

