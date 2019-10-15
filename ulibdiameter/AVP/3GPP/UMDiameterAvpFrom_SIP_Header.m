//
//  UMDiameterAvpFrom_SIP_Header.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFrom_SIP_Header.h"

@implementation UMDiameterAvpFrom_SIP_Header


- (NSString *)avpType
{
    return @"From-SIP-Header";
}

- (uint32_t)avpCode
{
    return 644;
}

+ (uint32_t)avpCode
{
    return 644;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

