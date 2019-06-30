//
//  UMDiameterAvpCSG_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpCSG_Id


- (NSString *)avpType
{
    return @"CSG-Id";
}

- (uint32_t)avpCode
{
    return 1437;
}

+ (uint32_t)avpCode
{
    return 1437;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

