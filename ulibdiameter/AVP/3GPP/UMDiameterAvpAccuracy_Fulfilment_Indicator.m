//
//  UMDiameterAvpAccuracy_Fulfilment_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccuracy_Fulfilment_Indicator.h"

@implementation UMDiameterAvpAccuracy_Fulfilment_Indicator


- (NSString *)avpType
{
    return @"Accuracy-Fulfilment-Indicator";
}

- (uint32_t)avpCode
{
    return 2513;
}

+ (uint32_t)avpCode
{
    return 2513;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

