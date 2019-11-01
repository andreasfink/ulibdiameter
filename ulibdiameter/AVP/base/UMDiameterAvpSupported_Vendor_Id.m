//
//  UMDiameterAvpSupported_Vendor_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Vendor_Id.h"

@implementation UMDiameterAvpSupported_Vendor_Id


- (NSString *)avpType
{
    return @"Supported-Vendor-Id";
}

- (uint32_t)avpCode
{
    return 265;
}

+ (uint32_t)avpCode
{
    return 265;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"supported-vendor-id";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

