//
//  UMDiameterAvpExpiry_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExpiry_Time.h"

@implementation UMDiameterAvpExpiry_Time


- (NSString *)avpType
{
    return @"Expiry-Time";
}

- (uint32_t)avpCode
{
    return 709;
}

+ (uint32_t)avpCode
{
    return 709;
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
    avpDef[@"name"] = @"expiry-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

