//
//  UMDiameterAvpEvent_Threshold_Event_1I.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Threshold_Event_1I.h"

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


@end

