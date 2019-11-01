//
//  UMDiameterAvpMBSFN_Area_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMBSFN_Area_ID.h"

@implementation UMDiameterAvpMBSFN_Area_ID


- (NSString *)avpType
{
    return @"MBSFN-Area-ID";
}

- (uint32_t)avpCode
{
    return 1695;
}

+ (uint32_t)avpCode
{
    return 1695;
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
    avpDef[@"name"] = @"mbsfn-area-id";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

