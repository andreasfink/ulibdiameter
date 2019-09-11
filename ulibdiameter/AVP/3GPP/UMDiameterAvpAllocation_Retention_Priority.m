//
//  UMDiameterAvpAllocation_Retention_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAllocation_Retention_Priority.h"
#import "UMDiameterAvpPriority_Level.h"
#import "UMDiameterAvpPre_emption_Capability.h"
#import "UMDiameterAvpPre_emption_Vulnerability.h"

@implementation UMDiameterAvpAllocation_Retention_Priority


- (NSString *)avpType
{
    return @"Allocation-Retention-Priority";
}

- (uint32_t)avpCode
{
    return 1034;
}

+ (uint32_t)avpCode
{
    return 1034;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_priority_level)
    {
        [arr addObject:_var_priority_level];
    }
    if(_var_pre_emption_capability)
    {
        [arr addObject:_var_pre_emption_capability];
    }
    if(_var_pre_emption_vulnerability)
    {
        [arr addObject:_var_pre_emption_vulnerability];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

