//
//  UMDiameterAvpRAT_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRAT_Type.h"

@implementation UMDiameterAvpRAT_Type


- (NSString *)avpType
{
    return @"RAT-Type";
}

- (uint32_t)avpCode
{
    return 1032;
}

+ (uint32_t)avpCode
{
    return 1032;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

