//
//  UMDiameterAvpSCEF_Reference_ID_for_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"

@implementation UMDiameterAvpSCEF_Reference_ID_for_Deletion


- (NSString *)avpType
{
    return @"SCEF-Reference-ID-for-Deletion";
}

- (uint32_t)avpCode
{
    return 3126;
}

+ (uint32_t)avpCode
{
    return 3126;
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
    avpDef[@"name"] = @"scef-reference-id-for-deletion";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

