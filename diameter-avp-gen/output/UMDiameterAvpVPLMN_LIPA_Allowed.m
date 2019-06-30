//
//  UMDiameterAvpVPLMN_LIPA_Allowed.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpVPLMN_LIPA_Allowed


- (NSString *)avpType
{
    return @"VPLMN-LIPA-Allowed";
}

- (uint32_t)avpCode
{
    return 1617;
}

+ (uint32_t)avpCode
{
    return 1617;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

