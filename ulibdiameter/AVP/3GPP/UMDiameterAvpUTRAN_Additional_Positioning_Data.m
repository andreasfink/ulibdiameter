//
//  UMDiameterAvpUTRAN_Additional_Positioning_Data.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpUTRAN_Additional_Positioning_Data.h>

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

