//
//  UMDiameterAvp3GPP_Originating_SIP_URI.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Originating_SIP_URI.h"

@implementation UMDiameterAvp3GPP_Originating_SIP_URI


- (NSString *)avpType
{
    return @"Originating-SIP-URI";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_Originating_SIP_URI;
}


@end
