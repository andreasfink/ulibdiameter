//
//  UMDiameterAvpEUTRAN_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEUTRAN_Positioning_Data.h"

@implementation UMDiameterAvpEUTRAN_Positioning_Data


- (NSString *)avpType
{
    return @"EUTRAN-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2516;
}

+ (uint32_t)avpCode
{
    return 2516;
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
    avpDef[@"name"] = @"eutran-positioning-data";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

