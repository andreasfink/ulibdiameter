//
//  UMDiameterAvpUser_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Id.h"

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


@end

