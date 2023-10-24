//
//  UMDiameterAvpCollection_Period_RRM_LTE.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCollection_Period_RRM_LTE.h"

@implementation UMDiameterAvpCollection_Period_RRM_LTE


- (NSString *)avpType
{
    return @"Collection-Period-RRM-LTE";
}

- (uint32_t)avpCode
{
    return 1657;
}

+ (uint32_t)avpCode
{
    return 1657;
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
    avpDef[@"name"] = @"collection-period-rrm-lte";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

