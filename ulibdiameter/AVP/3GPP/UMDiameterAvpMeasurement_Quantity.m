//
//  UMDiameterAvpMeasurement_Quantity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMeasurement_Quantity.h"

@implementation UMDiameterAvpMeasurement_Quantity


- (NSString *)avpType
{
    return @"Measurement-Quantity";
}

- (uint32_t)avpCode
{
    return 1660;
}

+ (uint32_t)avpCode
{
    return 1660;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

