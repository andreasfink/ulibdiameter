//
//  UMDiameterAvpMonitoring_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
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

