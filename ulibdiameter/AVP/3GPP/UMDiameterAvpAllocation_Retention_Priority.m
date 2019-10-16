//
//  UMDiameterAvpAllocation_Retention_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
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
        [_var_priority_level beforeEncode];
        [arr addObject:_var_priority_level];
    }
    if(_var_pre_emption_capability)
    {
        [_var_pre_emption_capability beforeEncode];
        [arr addObject:_var_pre_emption_capability];
    }
    if(_var_pre_emption_vulnerability)
    {
        [_var_pre_emption_vulnerability beforeEncode];
        [arr addObject:_var_pre_emption_vulnerability];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[priority-level]",webName];
        [UMDiameterAvpPriority_Level appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[pre-emption-capability]",webName];
        [UMDiameterAvpPre_emption_Capability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[pre-emption-vulnerability]",webName];
        [UMDiameterAvpPre_emption_Vulnerability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Priority-Level"] = [_var_priority_level objectValue];
	dict[@"Pre-emption-Capability"] = [_var_pre_emption_capability objectValue];
	dict[@"Pre-emption-Vulnerability"] = [_var_pre_emption_vulnerability objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"allocation-retention-priority";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpPriority_Level definition]];
    [entries addObject:[UMDiameterAvpPre_emption_Capability definition]];
    [entries addObject:[UMDiameterAvpPre_emption_Vulnerability definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

