//
//  UMDiameterAvpEvent_Threshold_RSRP.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
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

