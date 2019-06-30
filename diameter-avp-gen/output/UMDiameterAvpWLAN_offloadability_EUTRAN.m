//
//  UMDiameterAvpWLAN_offloadability_EUTRAN.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

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

