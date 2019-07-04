//
//  UMDiameterAvpA_MSISDN.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpA_MSISDN.h"

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


@end

