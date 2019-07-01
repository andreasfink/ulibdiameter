//
//  UMDiameterAvpCurrent_Location_Retrieved.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCurrent_Location_Retrieved.h"

@implementation UMDiameterAvpCurrent_Location_Retrieved


- (NSString *)avpType
{
    return @"Current-Location-Retrieved";
}

- (uint32_t)avpCode
{
    return 1610;
}

+ (uint32_t)avpCode
{
    return 1610;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

