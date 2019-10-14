//
//  UMDiameterAvpSupported_Vendor_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Vendor_Id.h"

@implementation UMDiameterAvpSupported_Vendor_Id


- (NSString *)avpType
{
    return @"Supported-Vendor-Id";
}

- (uint32_t)avpCode
{
    return 265;
}

+ (uint32_t)avpCode
{
    return 265;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

