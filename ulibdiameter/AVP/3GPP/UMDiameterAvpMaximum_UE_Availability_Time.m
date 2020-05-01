//
//  UMDiameterAvpMaximum_UE_Availability_Time.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_UE_Availability_Time.h"

@implementation UMDiameterAvpMaximum_UE_Availability_Time


- (NSString *)avpType
{
    return @"Maximum-UE-Availability-Time";
}

- (uint32_t)avpCode
{
    return 3329;
}

+ (uint32_t)avpCode
{
    return 3329;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"maximum-ue-availability-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

