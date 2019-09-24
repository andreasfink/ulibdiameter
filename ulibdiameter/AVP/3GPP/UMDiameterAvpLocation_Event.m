//
//  UMDiameterAvpLocation_Event.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocation_Event.h"

@implementation UMDiameterAvpLocation_Event


- (NSString *)avpType
{
    return @"Location-Event";
}

- (uint32_t)avpCode
{
    return 2518;
}

+ (uint32_t)avpCode
{
    return 2518;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

