//
//  UMDiameterAvpVendor_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVendor_Id.h"

@implementation UMDiameterAvpVendor_Id


- (NSString *)avpType
{
    return @"Vendor-Id";
}

- (uint32_t)avpCode
{
    return 266;
}

+ (uint32_t)avpCode
{
    return 266;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

