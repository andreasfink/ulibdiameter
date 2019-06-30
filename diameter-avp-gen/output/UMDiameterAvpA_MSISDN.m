//
//  UMDiameterAvpA_MSISDN.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpA_MSISDN


- (NSString *)avpType
{
    return @"A-MSISDN";
}

- (uint32_t)avpCode
{
    return 1643;
}

+ (uint32_t)avpCode
{
    return 1643;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

