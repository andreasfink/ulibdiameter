//
//  UMDiameterAvpInterval_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpInterval_Time.h"

@implementation UMDiameterAvpInterval_Time


- (NSString *)avpType
{
    return @"Interval-Time";
}

- (uint32_t)avpCode
{
    return 2539;
}

+ (uint32_t)avpCode
{
    return 2539;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

