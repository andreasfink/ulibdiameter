//
//  UMDiameterAvpEvent_Threshold_Event_1I.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpInteger32.h"

@implementation UMDiameterAvpEvent_Threshold_Event_1I


- (NSString *)avpType
{
    return @"Event-Threshold-Event-1I";
}

- (uint32_t)avpCode
{
    return 1662;
}

+ (uint32_t)avpCode
{
    return 1662;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

