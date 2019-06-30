//
//  UMDiameterAvpEvent_Threshold_RSRP.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpEvent_Threshold_RSRP


- (NSString *)avpType
{
    return @"Event-Threshold-RSRP";
}

- (uint32_t)avpCode
{
    return 1629;
}

+ (uint32_t)avpCode
{
    return 1629;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

