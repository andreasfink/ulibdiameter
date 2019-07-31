//
//  UMDiameterAvpMDT_Allowed_PLMN_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.459000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMDT_Allowed_PLMN_Id.h"

@implementation UMDiameterAvpMDT_Allowed_PLMN_Id


- (NSString *)avpType
{
    return @"MDT-Allowed-PLMN-Id";
}

- (uint32_t)avpCode
{
    return 1671;
}

+ (uint32_t)avpCode
{
    return 1671;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

