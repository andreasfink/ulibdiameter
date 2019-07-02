//
//  UMDiameterAvpDSR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDSR_Flags.h"

@implementation UMDiameterAvpDSR_Flags


- (NSString *)avpType
{
    return @"DSR-Flags";
}

- (uint32_t)avpCode
{
    return 1421;
}

+ (uint32_t)avpCode
{
    return 1421;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

