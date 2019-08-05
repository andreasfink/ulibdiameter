//
//  UMDiameterAvpAllocation_Retention_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
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

@end

