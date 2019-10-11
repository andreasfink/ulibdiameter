//
//  UMDiameterAvpSupported_Monitoring_Events.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Monitoring_Events.h"

@implementation UMDiameterAvpSupported_Monitoring_Events


- (NSString *)avpType
{
    return @"Supported-Monitoring-Events";
}

- (uint32_t)avpCode
{
    return 3144;
}

+ (uint32_t)avpCode
{
    return 3144;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

