//
//  UMDiameterAvpCommunication_Duration_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCommunication_Duration_Time.h"

@implementation UMDiameterAvpCommunication_Duration_Time


- (NSString *)avpType
{
    return @"Communication-Duration-Time";
}

- (uint32_t)avpCode
{
    return 3116;
}

+ (uint32_t)avpCode
{
    return 3116;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

