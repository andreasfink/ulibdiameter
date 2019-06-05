//
//  UMDiameterAvpSessionTimeout.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpSessionTimeout.h"

@implementation UMDiameterAvpSessionTimeout


- (NSString *)avpType
{
    return @"SessionTimeout";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SessionTimeout;
}


@end
