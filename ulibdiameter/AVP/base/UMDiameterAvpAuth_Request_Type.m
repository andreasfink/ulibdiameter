//
//  UMDiameterAvpAuth_Request_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuth_Request_Type.h"

@implementation UMDiameterAvpAuth_Request_Type


- (NSString *)avpType
{
    return @"Auth-Request-Type";
}

- (uint32_t)avpCode
{
    return 274;
}

+ (uint32_t)avpCode
{
    return 274;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

