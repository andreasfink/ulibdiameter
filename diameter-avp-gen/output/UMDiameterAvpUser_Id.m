//
//  UMDiameterAvpUser_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTF8String.h"

@implementation UMDiameterAvpUser_Id


- (NSString *)avpType
{
    return @"User-Id";
}

- (uint32_t)avpCode
{
    return 1444;
}

+ (uint32_t)avpCode
{
    return 1444;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

