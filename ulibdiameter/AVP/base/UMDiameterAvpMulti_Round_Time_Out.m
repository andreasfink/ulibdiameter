//
//  UMDiameterAvpMulti_Round_Time_Out.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMulti_Round_Time_Out.h"

@implementation UMDiameterAvpMulti_Round_Time_Out


- (NSString *)avpType
{
    return @"Multi-Round-Time-Out";
}

- (uint32_t)avpCode
{
    return 272;
}

+ (uint32_t)avpCode
{
    return 272;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"multi-round-time-out";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

