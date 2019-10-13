//
//  UMDiameterAvpReporting_Duration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Duration.h"

@implementation UMDiameterAvpReporting_Duration


- (NSString *)avpType
{
    return @"Reporting-Duration";
}

- (uint32_t)avpCode
{
    return 2563;
}

+ (uint32_t)avpCode
{
    return 2563;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

