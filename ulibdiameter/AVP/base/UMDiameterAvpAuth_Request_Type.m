//
//  UMDiameterAvpAuth_Request_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
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

