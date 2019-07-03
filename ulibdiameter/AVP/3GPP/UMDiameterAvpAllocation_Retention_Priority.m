//
//  UMDiameterAvpAllocation_Retention_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpPriority_Level  avpCode])
        {
            _var_priority_level = [[UMDiameterAvpPriority_Level alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_priority_level];
        }
        else if(avp.avpCode == [UMDiameterAvpPre_emption_Capability avpCode])
        {
            _var_pre_emption_capability = [[UMDiameterAvpPre_emption_Capability alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pre_emption_capability];
        }
        else if(avp.avpCode == [UMDiameterAvpPre_emption_Vulnerability avpCode])
        {
            _var_pre_emption_vulnerability = [[UMDiameterAvpPre_emption_Vulnerability alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pre_emption_vulnerability];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    [self setArray:knownAVPs];
}


@end

