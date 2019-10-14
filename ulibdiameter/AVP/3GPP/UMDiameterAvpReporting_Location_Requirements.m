//
//  UMDiameterAvpReporting_Location_Requirements.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Location_Requirements.h"

@implementation UMDiameterAvpReporting_Location_Requirements


- (NSString *)avpType
{
    return @"Reporting-Location-Requirements";
}

- (uint32_t)avpCode
{
    return 2564;
}

+ (uint32_t)avpCode
{
    return 2564;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

