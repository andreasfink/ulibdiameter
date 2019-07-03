//
//  UMDiameterAvpVendor_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 14:58:07.234000
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

