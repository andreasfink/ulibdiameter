//
//  UMDiameterAvp3GPP_SC_Address.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_SC_Address.h"

@implementation UMDiameterAvp3GPP_SC_Address


- (NSString *)avpType
{
    return @"SC-Address";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_SC_Address;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor; 
    _avpVendorId = UMDiameterVendorId_3GPP;
}

@end
