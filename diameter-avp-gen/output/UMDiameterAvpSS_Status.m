//
//  UMDiameterAvpSS_Status.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpSS_Status


- (NSString *)avpType
{
    return @"SS-Status";
}

- (uint32_t)avpCode
{
    return 1477;
}

+ (uint32_t)avpCode
{
    return 1477;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

