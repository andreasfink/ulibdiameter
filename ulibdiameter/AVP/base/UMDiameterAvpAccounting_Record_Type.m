//
//  UMDiameterAvpAccounting_Record_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccounting_Record_Type.h"

@implementation UMDiameterAvpAccounting_Record_Type


- (NSString *)avpType
{
    return @"Accounting-Record-Type";
}

- (uint32_t)avpCode
{
    return 480;
}

+ (uint32_t)avpCode
{
    return 480;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"accounting-record-type";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

