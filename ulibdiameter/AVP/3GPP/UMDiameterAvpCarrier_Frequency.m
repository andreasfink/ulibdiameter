//
//  UMDiameterAvpCarrier_Frequency.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
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

