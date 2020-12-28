//
//  UMDiameterAvpTime_Of_Day_End.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTime_Of_Day_End.h"

@implementation UMDiameterAvpTime_Of_Day_End


- (NSString *)avpType
{
    return @"Time-Of-Day-End";
}

- (uint32_t)avpCode
{
    return 562;
}

+ (uint32_t)avpCode
{
    return 562;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = NO, _vendorCode = 0 */
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"time-of-day-end";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

