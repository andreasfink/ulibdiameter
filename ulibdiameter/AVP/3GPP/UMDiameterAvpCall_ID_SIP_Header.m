//
//  UMDiameterAvpCall_ID_SIP_Header.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_ID_SIP_Header.h"

@implementation UMDiameterAvpCall_ID_SIP_Header


- (NSString *)avpType
{
    return @"Call-ID-SIP-Header";
}

- (uint32_t)avpCode
{
    return 643;
}

+ (uint32_t)avpCode
{
    return 643;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

