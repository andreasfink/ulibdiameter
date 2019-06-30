//
//  UMDiameterAvp3GPP_OFR_Flags.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_OFR_Flags.h"

@implementation UMDiameterAvp3GPP_OFR_Flags


- (NSString *)avpType
{
    return @"OFR-Flags";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_OFR_Flags;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterVendorId_3GPP;
}

- (BOOL)isSentOnGddInterface
{
    /*
     bit 0 S6a/S6d-Indicator
    This bit, when set, indicates that the OFR message is sent on the Gdd interface,
     i.e. the source node is an SGSN (or a combined MME/SGSN to which the UE
     is attached via UTRAN). This bit, when cleared, indicates that the OFR message
     is sent on the SGd interface, i.e. the source node is an MME (or a combined MME/SGSN to which the UE is attached via UTRAN or GERAN).
     */
    return self.value & 0x01;
}

- (void) setSentOnGddInterface:(BOOL)flag
{
    if(flag)
    {
        self.value =  self.value | 0x01;
    }
    else
    {
        self.value = self.value & ~0x01;
    }
}

@end
