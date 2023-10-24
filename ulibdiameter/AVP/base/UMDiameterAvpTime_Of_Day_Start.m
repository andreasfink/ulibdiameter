//
//  UMDiameterAvpTime_Of_Day_Start.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTime_Of_Day_Start.h"

@implementation UMDiameterAvpTime_Of_Day_Start


- (NSString *)avpType
{
    return @"Time-Of-Day-Start";
}

- (uint32_t)avpCode
{
    return 561;
}

+ (uint32_t)avpCode
{
    return 561;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"time-of-day-start";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

