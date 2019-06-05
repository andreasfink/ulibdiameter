//
//  UMDiameterAvpEventTimestamp.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEventTimestamp.h"

@implementation UMDiameterAvpEventTimestamp

- (NSString *)avpType
{
    return @"EventTimestamp";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_EventTimestamp;
}


@end
