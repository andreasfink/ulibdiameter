//
//  UMDiameterAvpEUTRAN_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEUTRAN_Positioning_Data.h"

@implementation UMDiameterAvpEUTRAN_Positioning_Data


- (NSString *)avpType
{
    return @"EUTRAN-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2516;
}

+ (uint32_t)avpCode
{
    return 2516;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

