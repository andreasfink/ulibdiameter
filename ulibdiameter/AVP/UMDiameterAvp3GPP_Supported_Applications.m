//
//  UMDiameterAvp3GPP_Supported_Applications.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Supported_Applications.h"




/*
 Supported-Applications ::= < A VP header: 631 10415 >
 *[ Auth-Application-Id ]
 *[ Acct-Application-Id ]
 *[ Vendor-Specific-Application-Id ]
 *[ AVP ]
*/

@implementation UMDiameterAvp3GPP_Supported_Applications


- (NSString *)avpType
{
    return @"Supported-Applications";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Supported_Applications;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor; /* can not be mandatory */
    _avpVendorId = UMDiameterVendorId_3GPP;
}

@end
