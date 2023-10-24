//
//  UMDiameterAvpFilter_Rule.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:47:29.588714
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFilter_Rule.h"

@implementation UMDiameterAvpFilter_Rule


- (NSString *)avpType
{
    return @"Filter-Rule";
}

- (uint32_t)avpCode
{
    return 509;
}

+ (uint32_t)avpCode
{
    return 509;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"filter-rule";
    avpDef[@"type"] = @"";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

