//
//  UMDiameterAvpVPLMN_Dynamic_Address_Allowed.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVPLMN_Dynamic_Address_Allowed.h"

@implementation UMDiameterAvpVPLMN_Dynamic_Address_Allowed


- (NSString *)avpType
{
    return @"VPLMN-Dynamic-Address-Allowed";
}

- (uint32_t)avpCode
{
    return 1432;
}

+ (uint32_t)avpCode
{
    return 1432;
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
    avpDef[@"name"] = @"vplmn-dynamic-address-allowed";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

