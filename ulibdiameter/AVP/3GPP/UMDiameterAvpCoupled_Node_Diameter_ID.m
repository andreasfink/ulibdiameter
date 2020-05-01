//
//  UMDiameterAvpCoupled_Node_Diameter_ID.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"coupled-node-diameter-id";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

