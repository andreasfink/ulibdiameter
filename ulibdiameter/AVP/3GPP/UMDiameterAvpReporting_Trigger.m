//
//  UMDiameterAvpReporting_Trigger.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_Trigger.h"

@implementation UMDiameterAvpReporting_Trigger


- (NSString *)avpType
{
    return @"Reporting-Trigger";
}

- (uint32_t)avpCode
{
    return 1626;
}

+ (uint32_t)avpCode
{
    return 1626;
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
    avpDef[@"name"] = @"reporting-trigger";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

