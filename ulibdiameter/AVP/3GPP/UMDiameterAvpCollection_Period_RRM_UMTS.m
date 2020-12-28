//
//  UMDiameterAvpCollection_Period_RRM_UMTS.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCollection_Period_RRM_UMTS.h"

@implementation UMDiameterAvpCollection_Period_RRM_UMTS


- (NSString *)avpType
{
    return @"Collection-Period-RRM-UMTS";
}

- (uint32_t)avpCode
{
    return 1658;
}

+ (uint32_t)avpCode
{
    return 1658;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 10415 */
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"collection-period-rrm-umts";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

