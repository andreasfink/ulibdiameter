//
//  UMDiameterAvp3GPP_SM_Delivery_Start_Time.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_SM_Delivery_Start_Time.h"

@implementation UMDiameterAvp3GPP_SM_Delivery_Start_Time


- (NSString *)avpType
{
    return @"SM-Delivery-Start-Time";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SM_Delivery_Start_Time;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterVendorId_3GPP;
}

@end
