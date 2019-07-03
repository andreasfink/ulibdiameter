//
//  UMDiameterAvpPre_emption_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPre_emption_Capability.h"

@implementation UMDiameterAvpPre_emption_Capability


- (NSString *)avpType
{
    return @"Pre-emption-Capability";
}

- (uint32_t)avpCode
{
    return 1047;
}

+ (uint32_t)avpCode
{
    return 1047;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

