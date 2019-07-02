//
//  UMDiameterAvpV2X_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpV2X_Permission.h"

@implementation UMDiameterAvpV2X_Permission


- (NSString *)avpType
{
    return @"V2X-Permission";
}

- (uint32_t)avpCode
{
    return 1689;
}

+ (uint32_t)avpCode
{
    return 1689;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

