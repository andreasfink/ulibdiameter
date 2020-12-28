//
//  UMDiameterAvpOC_Report_Type.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.515828
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
    /* _vendorFlag = NO, _vendorCode = 0 */
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

