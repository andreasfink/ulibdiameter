//
//  UMDiameterAvpSIPTO_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpSIPTO_Permission


- (NSString *)avpType
{
    return @"SIPTO-Permission";
}

- (uint32_t)avpCode
{
    return 1613;
}

+ (uint32_t)avpCode
{
    return 1613;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

