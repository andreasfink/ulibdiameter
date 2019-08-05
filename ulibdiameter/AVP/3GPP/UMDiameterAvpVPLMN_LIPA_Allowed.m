//
//  UMDiameterAvpVPLMN_LIPA_Allowed.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVPLMN_LIPA_Allowed.h"

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


@end

