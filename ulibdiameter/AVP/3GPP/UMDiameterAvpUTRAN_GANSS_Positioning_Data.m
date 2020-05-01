//
//  UMDiameterAvpUTRAN_GANSS_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_GANSS_Positioning_Data.h"

@implementation UMDiameterAvpUTRAN_GANSS_Positioning_Data


- (NSString *)avpType
{
    return @"UTRAN-GANSS-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2529;
}

+ (uint32_t)avpCode
{
    return 2529;
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
    avpDef[@"name"] = @"utran-ganss-positioning-data";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

