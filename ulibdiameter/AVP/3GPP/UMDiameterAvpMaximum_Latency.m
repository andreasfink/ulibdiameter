//
//  UMDiameterAvpMaximum_Latency.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_Latency.h"

@implementation UMDiameterAvpMaximum_Latency


- (NSString *)avpType
{
    return @"Maximum-Latency";
}

- (uint32_t)avpCode
{
    return 3133;
}

+ (uint32_t)avpCode
{
    return 3133;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

