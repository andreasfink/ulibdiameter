//
//  UMDiameterAvpLoad_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:36.334000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad_Value.h"

@implementation UMDiameterAvpLoad_Value


- (NSString *)avpType
{
    return @"Load-Value";
}

- (uint32_t)avpCode
{
    return 652;
}

+ (uint32_t)avpCode
{
    return 652;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"load-value";
    avpDef[@"type"] = @"Unsigned64";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

