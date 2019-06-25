//
//  UMDiameterAvp3GPP_SM_Delivery_Timer.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_SM_Delivery_Timer.h"

@implementation UMDiameterAvp3GPP_SM_Delivery_Timer

- (NSString *)avpType
{
    return @"SM-Delivery-Timer";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SM_Delivery_Timer;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

@end
