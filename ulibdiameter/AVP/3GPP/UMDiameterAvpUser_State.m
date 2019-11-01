//
//  UMDiameterAvpUser_State.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_State.h"

@implementation UMDiameterAvpUser_State


- (NSString *)avpType
{
    return @"User-State";
}

- (uint32_t)avpCode
{
    return 1499;
}

+ (uint32_t)avpCode
{
    return 1499;
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
    avpDef[@"name"] = @"user-state";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

