//
//  UMDiameterAvpWLAN_offloadability_UTRAN.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability_UTRAN.h"

@implementation UMDiameterAvpWLAN_offloadability_UTRAN


- (NSString *)avpType
{
    return @"WLAN-offloadability-UTRAN";
}

- (uint32_t)avpCode
{
    return 1669;
}

+ (uint32_t)avpCode
{
    return 1669;
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
    avpDef[@"name"] = @"wlan-offloadability-utran";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

