//
//  UMDiameterAvpVendor_Id.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVendor_Id.h"

@implementation UMDiameterAvpVendor_Id


- (NSString *)avpType
{
    return @"Vendor-Id";
}

- (uint32_t)avpCode
{
    return 266;
}

+ (uint32_t)avpCode
{
    return 266;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"vendor-id";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

