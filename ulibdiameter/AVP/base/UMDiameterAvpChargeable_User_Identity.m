//
//  UMDiameterAvpChargeable_User_Identity.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpChargeable_User_Identity.h"

@implementation UMDiameterAvpChargeable_User_Identity


- (NSString *)avpType
{
    return @"Chargeable-User-Identity";
}

- (uint32_t)avpCode
{
    return 89;
}

+ (uint32_t)avpCode
{
    return 89;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"chargeable-user-identity";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

