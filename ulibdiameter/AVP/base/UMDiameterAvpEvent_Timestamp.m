//
//  UMDiameterAvpEvent_Timestamp.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.128000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Timestamp.h"

@implementation UMDiameterAvpEvent_Timestamp


- (NSString *)avpType
{
    return @"Event-Timestamp";
}

- (uint32_t)avpCode
{
    return 55;
}

+ (uint32_t)avpCode
{
    return 55;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"event-timestamp";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

