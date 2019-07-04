//
//  UMDiameterAvpLast_UE_Activity_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLast_UE_Activity_Time.h"

@implementation UMDiameterAvpLast_UE_Activity_Time


- (NSString *)avpType
{
    return @"Last-UE-Activity-Time";
}

- (uint32_t)avpCode
{
    return 1494;
}

+ (uint32_t)avpCode
{
    return 1494;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

