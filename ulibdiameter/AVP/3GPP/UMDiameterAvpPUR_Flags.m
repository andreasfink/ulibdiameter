//
//  UMDiameterAvpPUR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPUR_Flags.h"

@implementation UMDiameterAvpPUR_Flags


- (NSString *)avpType
{
    return @"PUR-Flags";
}

- (uint32_t)avpCode
{
    return 1635;
}

+ (uint32_t)avpCode
{
    return 1635;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

