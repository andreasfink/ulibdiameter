//
//  UMDiameterAvpPrioritized_List_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPrioritized_List_Indicator.h"

@implementation UMDiameterAvpPrioritized_List_Indicator


- (NSString *)avpType
{
    return @"Prioritized-List-Indicator";
}

- (uint32_t)avpCode
{
    return 2551;
}

+ (uint32_t)avpCode
{
    return 2551;
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
    avpDef[@"name"] = @"prioritized-list-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

