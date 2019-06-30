//
//  UMDiameterAvpCoupled_Node_Diameter_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDiameterIdentity.h"

@implementation UMDiameterAvpCoupled_Node_Diameter_ID


- (NSString *)avpType
{
    return @"Coupled-Node-Diameter-ID";
}

- (uint32_t)avpCode
{
    return 1666;
}

+ (uint32_t)avpCode
{
    return 1666;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

