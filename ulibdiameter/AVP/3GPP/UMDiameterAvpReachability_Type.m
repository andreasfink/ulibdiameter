//
//  UMDiameterAvpReachability_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReachability_Type.h"

@implementation UMDiameterAvpReachability_Type


- (NSString *)avpType
{
    return @"Reachability-Type";
}

- (uint32_t)avpCode
{
    return 3132;
}

+ (uint32_t)avpCode
{
    return 3132;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
