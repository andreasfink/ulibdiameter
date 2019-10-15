//
//  UMDiameterAvpAuth_Session_State.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:18.862000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuth_Session_State.h"

@implementation UMDiameterAvpAuth_Session_State


- (NSString *)avpType
{
    return @"Auth-Session-State";
}

- (uint32_t)avpCode
{
    return 277;
}

+ (uint32_t)avpCode
{
    return 277;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

