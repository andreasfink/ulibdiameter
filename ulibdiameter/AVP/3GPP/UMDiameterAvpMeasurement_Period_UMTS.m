//
//  UMDiameterAvpMeasurement_Period_UMTS.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpMeasurement_Period_UMTS


- (NSString *)avpType
{
    return @"Measurement-Period-UMTS";
}

- (uint32_t)avpCode
{
    return 1656;
}

+ (uint32_t)avpCode
{
    return 1656;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

