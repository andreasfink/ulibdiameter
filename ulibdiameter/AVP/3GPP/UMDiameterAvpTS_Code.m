//
//  UMDiameterAvpTS_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTS_Code.h"

@implementation UMDiameterAvpTS_Code


- (NSString *)avpType
{
    return @"TS-Code";
}

- (uint32_t)avpCode
{
    return 1487;
}

+ (uint32_t)avpCode
{
    return 1487;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

