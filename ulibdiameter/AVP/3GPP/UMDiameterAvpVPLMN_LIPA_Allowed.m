//
//  UMDiameterAvpVPLMN_LIPA_Allowed.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVPLMN_LIPA_Allowed.h"

@implementation UMDiameterAvpVPLMN_LIPA_Allowed


- (NSString *)avpType
{
    return @"VPLMN-LIPA-Allowed";
}

- (uint32_t)avpCode
{
    return 1617;
}

+ (uint32_t)avpCode
{
    return 1617;
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
    avpDef[@"name"] = @"vplmn-lipa-allowed";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

