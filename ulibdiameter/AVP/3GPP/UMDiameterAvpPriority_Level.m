//
//  UMDiameterAvpPriority_Level.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPriority_Level.h"

@implementation UMDiameterAvpPriority_Level


- (NSString *)avpType
{
    return @"Priority-Level";
}

- (uint32_t)avpCode
{
    return 1046;
}

+ (uint32_t)avpCode
{
    return 1046;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

