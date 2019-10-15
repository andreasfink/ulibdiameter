//
//  UMDiameterAvpExpiry_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExpiry_Time.h"

@implementation UMDiameterAvpExpiry_Time


- (NSString *)avpType
{
    return @"Expiry-Time";
}

- (uint32_t)avpCode
{
    return 709;
}

+ (uint32_t)avpCode
{
    return 709;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

