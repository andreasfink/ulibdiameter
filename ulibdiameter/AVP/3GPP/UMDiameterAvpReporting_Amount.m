//
//  UMDiameterAvpReporting_Amount.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Amount.h"

@implementation UMDiameterAvpReporting_Amount


- (NSString *)avpType
{
    return @"Reporting-Amount";
}

- (uint32_t)avpCode
{
    return 2541;
}

+ (uint32_t)avpCode
{
    return 2541;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

