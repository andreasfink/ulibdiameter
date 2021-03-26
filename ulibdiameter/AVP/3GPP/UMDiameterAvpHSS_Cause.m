//
//  UMDiameterAvpHSS_Cause.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHSS_Cause.h"

@implementation UMDiameterAvpHSS_Cause


- (NSString *)avpType
{
    return @"HSS-Cause";
}

- (uint32_t)avpCode
{
    return 3109;
}

+ (uint32_t)avpCode
{
    return 3109;
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
    avpDef[@"name"] = @"hss-cause";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

