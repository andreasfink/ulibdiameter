//
//  UMDiameterAvpTermination_Cause.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:00.964000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTermination_Cause.h"

@implementation UMDiameterAvpTermination_Cause


- (NSString *)avpType
{
    return @"Termination-Cause";
}

- (uint32_t)avpCode
{
    return 295;
}

+ (uint32_t)avpCode
{
    return 295;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"termination-cause";
    avpDef[@"type"] = @"Enumerated ";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

