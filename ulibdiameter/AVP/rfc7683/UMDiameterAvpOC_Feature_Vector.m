//
//  UMDiameterAvpOC_Feature_Vector.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.741533
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpOC_Feature_Vector.h>

@implementation UMDiameterAvpOC_Feature_Vector


- (NSString *)avpType
{
    return @"OC-Feature-Vector";
}

- (uint32_t)avpCode
{
    return 622;
}

+ (uint32_t)avpCode
{
    return 622;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"oc-feature-vector";
    avpDef[@"type"] = @"Unsigned64";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

