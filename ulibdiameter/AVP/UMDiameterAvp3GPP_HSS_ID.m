//
//  UMDiameterAvp3GPP_HSS_ID.m
//  ulibdiameter
//
//  Created by Andreas Fink on 07.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_HSS_ID.h"

@implementation UMDiameterAvp3GPP_HSS_ID

- (NSString *)avpType
{
    return @"HSS-ID";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_MSISDN;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

@end
