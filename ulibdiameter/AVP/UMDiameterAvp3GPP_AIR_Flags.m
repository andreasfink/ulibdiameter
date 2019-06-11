//
//  UMDiameterAvp3GPP_AIR_Flags.m
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_AIR_Flags.h"

@implementation UMDiameterAvp3GPP_AIR_Flags


- (NSString *)avpType
{
    return @"AIR-Flags";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AIR_Flags;
}

- (NSString *)value
{
    return NULL;
}

- (void)setValue:(NSString *)str
{
}

@end
