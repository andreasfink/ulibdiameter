//
//  UMDiameterAvp3GPP_Maximum_Retransmission_Time.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Maximum_Retransmission_Time.h"

@implementation UMDiameterAvp3GPP_Maximum_Retransmission_Time


- (NSString *)avpType
{
    return @"Maximum-Retransmission-Time";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_Maximum_Retransmission_Time;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterVendorId_3GPP;
}

@end
