//
//  UMDiameterAvpLast_UE_Activity_Time.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLast_UE_Activity_Time.h"

@implementation UMDiameterAvpLast_UE_Activity_Time


- (NSString *)avpType
{
    return @"Last-UE-Activity-Time";
}

- (uint32_t)avpCode
{
    return 1494;
}

+ (uint32_t)avpCode
{
    return 1494;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"last-ue-activity-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

