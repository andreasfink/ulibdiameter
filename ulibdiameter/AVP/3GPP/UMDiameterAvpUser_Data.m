//
//  UMDiameterAvpUser_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 22:51:11.075808
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Data.h"

@implementation UMDiameterAvpUser_Data


- (NSString *)avpType
{
    return @"User-Data";
}

- (uint32_t)avpCode
{
    return 702;
}

+ (uint32_t)avpCode
{
    return 702;
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
    avpDef[@"name"] = @"user-data";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

