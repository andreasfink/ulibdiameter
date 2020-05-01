//
//  UMDiameterAvpSourceID.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:16.139994
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSourceID.h"

@implementation UMDiameterAvpSourceID


- (NSString *)avpType
{
    return @"SourceID";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sourceid";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

