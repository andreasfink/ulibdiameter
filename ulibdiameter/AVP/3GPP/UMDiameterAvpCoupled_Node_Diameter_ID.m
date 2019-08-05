//
//  UMDiameterAvpCoupled_Node_Diameter_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCoupled_Node_Diameter_ID.h"

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


@end

