//
//  UMDiameterAvpMDT_Allowed_PLMN_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMDT_Allowed_PLMN_Id.h"

@implementation UMDiameterAvpMDT_Allowed_PLMN_Id


- (NSString *)avpType
{
    return @"MDT-Allowed-PLMN-Id";
}

- (uint32_t)avpCode
{
    return 1671;
}

+ (uint32_t)avpCode
{
    return 1671;
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
    avpDef[@"name"] = @"mdt-allowed-plmn-id";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

