//
//  UMDiameterAvpCommunication_Duration_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCommunication_Duration_Time.h"

@implementation UMDiameterAvpCommunication_Duration_Time


- (NSString *)avpType
{
    return @"Communication-Duration-Time";
}

- (uint32_t)avpCode
{
    return 3116;
}

+ (uint32_t)avpCode
{
    return 3116;
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
    avpDef[@"name"] = @"communication-duration-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

