//
//  UMDiameterAvpAuthSessionState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAuthSessionState.h"

@implementation UMDiameterAvpAuthSessionState


- (NSString *)avpType
{
    return @"AuhtSessionState";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthSessionState;
}
- (void)setStringValue:(NSString *)string
{
}

- (NSString *)stringValue
{
    return @"not-implemented";
}


@end
