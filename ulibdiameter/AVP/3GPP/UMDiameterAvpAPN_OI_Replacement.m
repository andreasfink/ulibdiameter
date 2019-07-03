//
//  UMDiameterAvpAPN_OI_Replacement.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_OI_Replacement.h"

@implementation UMDiameterAvpAPN_OI_Replacement


- (NSString *)avpType
{
    return @"APN-OI-Replacement";
}

- (uint32_t)avpCode
{
    return 1427;
}

+ (uint32_t)avpCode
{
    return 1427;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

