//
//  UMDiameterAvp3GPP_SMS_GMSC_Address.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_SMS_GMSC_Address.h"

@implementation UMDiameterAvp3GPP_SMS_GMSC_Address


- (NSString *)avpType
{
    return @"SMS-GMSC-Address";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SMS_GMSC_Address;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

@end
