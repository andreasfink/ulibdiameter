//
//  UMDiameterAvpAcct_Interim_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Interim_Interval.h"

@implementation UMDiameterAvpAcct_Interim_Interval


- (NSString *)avpType
{
    return @"Acct-Interim-Interval";
}

- (uint32_t)avpCode
{
    return 85;
}

+ (uint32_t)avpCode
{
    return 85;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"acct-interim-interval";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

