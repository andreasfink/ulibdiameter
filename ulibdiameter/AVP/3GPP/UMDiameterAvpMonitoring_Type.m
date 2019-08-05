//
//  UMDiameterAvpMonitoring_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Type.h"

@implementation UMDiameterAvpMonitoring_Type


- (NSString *)avpType
{
    return @"Monitoring-Type";
}

- (uint32_t)avpCode
{
    return 3127;
}

+ (uint32_t)avpCode
{
    return 3127;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

