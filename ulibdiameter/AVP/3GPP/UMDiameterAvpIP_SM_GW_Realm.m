//
//  UMDiameterAvpIP_SM_GW_Realm.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIP_SM_GW_Realm.h"

@implementation UMDiameterAvpIP_SM_GW_Realm


- (NSString *)avpType
{
    return @"IP-SM-GW-Realm";
}

- (uint32_t)avpCode
{
    return 3112;
}

+ (uint32_t)avpCode
{
    return 3112;
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
    avpDef[@"name"] = @"ip-sm-gw-realm";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

