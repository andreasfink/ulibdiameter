//
//  UMDiameterAvpMeasurement_Period_LTE.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMeasurement_Period_LTE.h"

@implementation UMDiameterAvpMeasurement_Period_LTE


- (NSString *)avpType
{
    return @"Measurement-Period-LTE";
}

- (uint32_t)avpCode
{
    return 1655;
}

+ (uint32_t)avpCode
{
    return 1655;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

