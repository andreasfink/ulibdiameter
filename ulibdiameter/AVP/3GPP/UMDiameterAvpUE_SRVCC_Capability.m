//
//  UMDiameterAvpUE_SRVCC_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_SRVCC_Capability.h"

@implementation UMDiameterAvpUE_SRVCC_Capability


- (NSString *)avpType
{
    return @"UE-SRVCC-Capability";
}

- (uint32_t)avpCode
{
    return 1615;
}

+ (uint32_t)avpCode
{
    return 1615;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

