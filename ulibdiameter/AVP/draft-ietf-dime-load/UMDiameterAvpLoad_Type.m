//
//  UMDiameterAvpLoad_Type.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.486307
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
    /* _vendorFlag = NO, _vendorCode = 0 */
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

