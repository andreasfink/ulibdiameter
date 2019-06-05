//
//  UMDiameterAvpMultiRoundTimeout.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpMultiRoundTimeout.h"

@implementation UMDiameterAvpMultiRoundTimeout


- (NSString *)avpType
{
    return @"MultiRoundTimeout";
}



- (uint32_t)avpCode
{
    return UMDiameterAvpCode_MultiRoundTimeout;
}


@end
