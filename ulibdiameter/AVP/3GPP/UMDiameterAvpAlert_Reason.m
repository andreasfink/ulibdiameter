//
//  UMDiameterAvpAlert_Reason.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAlert_Reason.h"

@implementation UMDiameterAvpAlert_Reason


- (NSString *)avpType
{
    return @"Alert-Reason";
}

- (uint32_t)avpCode
{
    return 1434;
}

+ (uint32_t)avpCode
{
    return 1434;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

