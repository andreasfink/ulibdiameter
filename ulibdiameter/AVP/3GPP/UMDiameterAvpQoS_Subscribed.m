//
//  UMDiameterAvpQoS_Subscribed.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Subscribed.h"

@implementation UMDiameterAvpQoS_Subscribed


- (NSString *)avpType
{
    return @"QoS-Subscribed";
}

- (uint32_t)avpCode
{
    return 1404;
}

+ (uint32_t)avpCode
{
    return 1404;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

