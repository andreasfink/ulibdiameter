//
//  UMDiameterAvpOC_Report_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:36.354000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Report_Type.h"

@implementation UMDiameterAvpOC_Report_Type


- (NSString *)avpType
{
    return @"OC-Report-Type";
}

- (uint32_t)avpCode
{
    return 626;
}

+ (uint32_t)avpCode
{
    return 626;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"oc-report-type";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

