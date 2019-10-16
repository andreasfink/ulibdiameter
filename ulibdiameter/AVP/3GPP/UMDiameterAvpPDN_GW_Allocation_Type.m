//
//  UMDiameterAvpPDN_GW_Allocation_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDN_GW_Allocation_Type.h"

@implementation UMDiameterAvpPDN_GW_Allocation_Type


- (NSString *)avpType
{
    return @"PDN-GW-Allocation-Type";
}

- (uint32_t)avpCode
{
    return 1438;
}

+ (uint32_t)avpCode
{
    return 1438;
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
    avpDef[@"name"] = @"pdn-gw-allocation-type";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

