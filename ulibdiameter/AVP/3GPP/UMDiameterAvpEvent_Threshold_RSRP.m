//
//  UMDiameterAvpEvent_Threshold_RSRP.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_RSRP.h"

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


@end

