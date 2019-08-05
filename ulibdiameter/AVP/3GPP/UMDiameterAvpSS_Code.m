//
//  UMDiameterAvpSS_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSS_Code.h"

@implementation UMDiameterAvpSS_Code


- (NSString *)avpType
{
    return @"SS-Code";
}

- (uint32_t)avpCode
{
    return 1476;
}

+ (uint32_t)avpCode
{
    return 1476;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

