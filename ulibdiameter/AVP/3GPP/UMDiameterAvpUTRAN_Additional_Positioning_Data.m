//
//  UMDiameterAvpUTRAN_Additional_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Additional_Positioning_Data.h"

@implementation UMDiameterAvpUTRAN_Additional_Positioning_Data


- (NSString *)avpType
{
    return @"UTRAN-Additional-Positioning-Data";
}

- (uint32_t)avpCode
{
    return 2558;
}

+ (uint32_t)avpCode
{
    return 2558;
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
    avpDef[@"name"] = @"utran-additional-positioning-data";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

