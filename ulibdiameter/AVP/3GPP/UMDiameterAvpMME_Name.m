//
//  UMDiameterAvpMME_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Name.h"

@implementation UMDiameterAvpMME_Name


- (NSString *)avpType
{
    return @"MME-Name";
}

- (uint32_t)avpCode
{
    return 2402;
}

+ (uint32_t)avpCode
{
    return 2402;
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
    avpDef[@"name"] = @"mme-name";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

