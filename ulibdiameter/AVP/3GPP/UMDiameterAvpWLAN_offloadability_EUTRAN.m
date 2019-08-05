//
//  UMDiameterAvpWLAN_offloadability_EUTRAN.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability_EUTRAN.h"

@implementation UMDiameterAvpWLAN_offloadability_EUTRAN


- (NSString *)avpType
{
    return @"WLAN-offloadability-EUTRAN";
}

- (uint32_t)avpCode
{
    return 1668;
}

+ (uint32_t)avpCode
{
    return 1668;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

