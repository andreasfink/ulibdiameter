//
//  UMDiameterAvpPeriodic_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPeriodic_Time.h"

@implementation UMDiameterAvpPeriodic_Time


- (NSString *)avpType
{
    return @"Periodic-Time";
}

- (uint32_t)avpCode
{
    return 3117;
}

+ (uint32_t)avpCode
{
    return 3117;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

