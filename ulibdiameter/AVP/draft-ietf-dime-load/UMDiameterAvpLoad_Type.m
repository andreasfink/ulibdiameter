//
//  UMDiameterAvpLoad_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.463000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad_Type.h"

@implementation UMDiameterAvpLoad_Type


- (NSString *)avpType
{
    return @"Load-Type";
}

- (uint32_t)avpCode
{
    return 651;
}

+ (uint32_t)avpCode
{
    return 651;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"load-type";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

