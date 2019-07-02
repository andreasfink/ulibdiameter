//
//  UMDiameterAvpDaylight_Saving_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDaylight_Saving_Time.h"

@implementation UMDiameterAvpDaylight_Saving_Time


- (NSString *)avpType
{
    return @"Daylight-Saving-Time";
}

- (uint32_t)avpCode
{
    return 1650;
}

+ (uint32_t)avpCode
{
    return 1650;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

