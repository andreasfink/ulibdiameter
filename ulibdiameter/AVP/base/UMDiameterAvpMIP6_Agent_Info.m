//
//  UMDiameterAvpMIP6_Agent_Info.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpMIP_Home_Agent_Address.h"
#import "UMDiameterAvpMIP_Home_Agent_Host.h"
#import "UMDiameterAvpMIP6_Home_Link_Prefix.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMIP6_Agent_Info


- (NSString *)avpType
{
    return @"MIP6-Agent-Info";
}

- (uint32_t)avpCode
{
    return 486;
}

+ (uint32_t)avpCode
{
    return 486;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_mip_home_agent_address.count > 0)
    {
        for(UMDiameterAvpMIP_Home_Agent_Address *o in _var_mip_home_agent_address)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_mip_home_agent_host)
    {
        [_var_mip_home_agent_host beforeEncode];
        [arr addObject:_var_mip_home_agent_host];
    }
    if(_var_mip6_home_link_prefix)
    {
        [_var_mip6_home_link_prefix beforeEncode];
        [arr addObject:_var_mip6_home_link_prefix];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mip-home-agent-address][]",webName];
        [UMDiameterAvpMIP_Home_Agent_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mip-home-agent-host]",webName];
        [UMDiameterAvpMIP_Home_Agent_Host appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mip6-home-link-prefix]",webName];
        [UMDiameterAvpMIP6_Home_Link_Prefix appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_mip_home_agent_address.count>0)
		{
			for(UMDiameterAvp *avp in _var_mip_home_agent_address)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"MIP-Home-Agent-Address"] = arr;
		}
	}
	dict[@"MIP-Home-Agent-Host"] = [_var_mip_home_agent_host objectValue];
	dict[@"MIP6-Home-Link-Prefix"] = [_var_mip6_home_link_prefix objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip6-agent-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMIP_Home_Agent_Address definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        def[@"maximum-count"]=@(2);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMIP_Home_Agent_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMIP6_Home_Link_Prefix definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

