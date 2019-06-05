//
//  UMDiameterAvpSessionServerFailover.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpSessionServerFailover.h"

@implementation UMDiameterAvpSessionServerFailover

- (NSString *)avpType
{
    return @"SessionServerFailover";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SessionServerFailover;
}


@end
