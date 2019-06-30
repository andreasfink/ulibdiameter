//
//  UMDiameterAvpAuth_Session_State.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuth_Session_State.h"

@implementation UMDiameterAvpAuth_Session_State


- (NSString *)avpType
{
    return @"Auth-Session-State";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_Auth_Session_State;
}
- (void)setStringValue:(NSString *)string
{
}

- (NSString *)stringValue
{
    return @"not-implemented";
}


@end
