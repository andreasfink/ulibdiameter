//
//  UMDiameterAvpMaximum_Response_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_Response_Time.h"

@implementation UMDiameterAvpMaximum_Response_Time


- (NSString *)avpType
{
    return @"Maximum-Response-Time";
}

- (uint32_t)avpCode
{
    return 3134;
}

+ (uint32_t)avpCode
{
    return 3134;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

