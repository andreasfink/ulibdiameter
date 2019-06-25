//
//  UMDiameterAvp3GPP_Public_Identity.m
//  ulibdiameter
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Public_Identity.h"

@implementation UMDiameterAvp3GPP_Public_Identity

- (NSString *)avpType
{
    return @"Public-Identity";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Public_Identity;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

@end
