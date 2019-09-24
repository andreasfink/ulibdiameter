//
//  UMDiameterAvpBarometric_Pressure.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpBarometric_Pressure.h"

@implementation UMDiameterAvpBarometric_Pressure


- (NSString *)avpType
{
    return @"Barometric-Pressure";
}

- (uint32_t)avpCode
{
    return 2557;
}

+ (uint32_t)avpCode
{
    return 2557;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

