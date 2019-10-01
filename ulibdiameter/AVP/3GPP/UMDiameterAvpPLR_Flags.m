//
//  UMDiameterAvpPLR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPLR_Flags.h"

@implementation UMDiameterAvpPLR_Flags


- (NSString *)avpType
{
    return @"PLR-Flags";
}

- (uint32_t)avpCode
{
    return 2545;
}

+ (uint32_t)avpCode
{
    return 2545;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

