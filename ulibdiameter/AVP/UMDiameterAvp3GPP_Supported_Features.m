//
//  UMDiameterAvp3GPP_Supported_Features.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Supported_Features.h"



/*
 Supported-Features ::= < A VP header: 628 10415 >
 { Vendor-Id }
 { Feature-List-ID }
 { Feature-List }
 *[AVP]
 */

@implementation UMDiameterAvp3GPP_Supported_Features


- (NSString *)avpType
{
    return @"Supported-Features";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Supported_Features;
}

@end
