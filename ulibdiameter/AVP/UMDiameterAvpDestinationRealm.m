//
//  UMDiameterAvpDestinationRealm.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDestinationRealm.h"

@implementation UMDiameterAvpDestinationRealm


- (NSString *)avpType
{
    return @"DestinationRealm";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_DestinationRealm;
}


@end
