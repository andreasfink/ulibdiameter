//
//  UMDiameterAvpMonitoring_Duration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Duration.h"

@implementation UMDiameterAvpMonitoring_Duration


- (NSString *)avpType
{
    return @"Monitoring-Duration";
}

- (uint32_t)avpCode
{
    return 3130;
}

+ (uint32_t)avpCode
{
    return 3130;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

