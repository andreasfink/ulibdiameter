//
//  UMDiameterAvpSCEF_ID.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_ID.h"

@implementation UMDiameterAvpSCEF_ID


- (NSString *)avpType
{
    return @"SCEF-ID";
}

- (uint32_t)avpCode
{
    return 3125;
}

+ (uint32_t)avpCode
{
    return 3125;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"scef-id";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

