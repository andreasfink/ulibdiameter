//
//  UMDiameterAvpCarrier_Frequency.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCarrier_Frequency.h"

@implementation UMDiameterAvpCarrier_Frequency


- (NSString *)avpType
{
    return @"Carrier-Frequency";
}

- (uint32_t)avpCode
{
    return 1696;
}

+ (uint32_t)avpCode
{
    return 1696;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

