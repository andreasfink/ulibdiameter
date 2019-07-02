//
//  UMDiameterAvpEvent_Threshold_Event_1F.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_Event_1F.h"

@implementation UMDiameterAvpEvent_Threshold_Event_1F


- (NSString *)avpType
{
    return @"Event-Threshold-Event-1F";
}

- (uint32_t)avpCode
{
    return 1661;
}

+ (uint32_t)avpCode
{
    return 1661;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

