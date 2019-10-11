//
//  UMDiameterAvpWLAN_offloadability_UTRAN.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability_UTRAN.h"

@implementation UMDiameterAvpWLAN_offloadability_UTRAN


- (NSString *)avpType
{
    return @"WLAN-offloadability-UTRAN";
}

- (uint32_t)avpCode
{
    return 1669;
}

+ (uint32_t)avpCode
{
    return 1669;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

