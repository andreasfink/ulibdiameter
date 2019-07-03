//
//  UMDiameterAvpEmergency_Services.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEmergency_Services.h"

@implementation UMDiameterAvpEmergency_Services


- (NSString *)avpType
{
    return @"Emergency-Services";
}

- (uint32_t)avpCode
{
    return 1538;
}

+ (uint32_t)avpCode
{
    return 1538;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

