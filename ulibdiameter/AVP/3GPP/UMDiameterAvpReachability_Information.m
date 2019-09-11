//
//  UMDiameterAvpReachability_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReachability_Information.h"

@implementation UMDiameterAvpReachability_Information


- (NSString *)avpType
{
    return @"Reachability-Information";
}

- (uint32_t)avpCode
{
    return 3140;
}

+ (uint32_t)avpCode
{
    return 3140;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

