//
//  UMDiameterAvpSGSN_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpSGSN_Number


- (NSString *)avpType
{
    return @"SGSN-Number";
}

- (uint32_t)avpCode
{
    return 1489;
}

+ (uint32_t)avpCode
{
    return 1489;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

