//
//  UMDiameterAvp3GPP2_MEID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvp3GPP2_MEID


- (NSString *)avpType
{
    return @"3GPP2-MEID";
}

- (uint32_t)avpCode
{
    return 1471;
}

+ (uint32_t)avpCode
{
    return 1471;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

