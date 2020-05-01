//
//  UMDiameterAvpSGSN_Name.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Name.h"

@implementation UMDiameterAvpSGSN_Name


- (NSString *)avpType
{
    return @"SGSN-Name";
}

- (uint32_t)avpCode
{
    return 2409;
}

+ (uint32_t)avpCode
{
    return 2409;
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
    avpDef[@"name"] = @"sgsn-name";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

