//
//  UMDiameterAvpAPN_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpServed_Party_IP_Address.h"
#import "UMDiameterAvpPDN_Type.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpEPS_Subscribed_QoS_Profile.h"
#import "UMDiameterAvpVPLMN_Dynamic_Address_Allowed.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"

@implementation UMDiameterAvpAPN_Configuration


- (NSString *)avpType
{
    return @"APN-Configuration";
}

- (uint32_t)avpCode
{
    return 1430;
}

+ (uint32_t)avpCode
{
    return 1430;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_context_identifier)
    {
        [_var_context_identifier beforeEncode];
        [arr addObject:_var_context_identifier];
    }
    if(_var_served_party_ip_address.count > 0)
    {
        for(UMDiameterAvpServed_Party_IP_Address *o in _var_served_party_ip_address)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_pdn_type)
    {
        [_var_pdn_type beforeEncode];
        [arr addObject:_var_pdn_type];
    }
    if(_var_service_selection)
    {
        [_var_service_selection beforeEncode];
        [arr addObject:_var_service_selection];
    }
    if(_var_eps_subscribed_qos_profile)
    {
        [_var_eps_subscribed_qos_profile beforeEncode];
        [arr addObject:_var_eps_subscribed_qos_profile];
    }
    if(_var_vplmn_dynamic_address_allowed)
    {
        [_var_vplmn_dynamic_address_allowed beforeEncode];
        [arr addObject:_var_vplmn_dynamic_address_allowed];
    }
    if(_var_mip6_agent_info)
    {
        [_var_mip6_agent_info beforeEncode];
        [arr addObject:_var_mip6_agent_info];
    }
    if(_var_visited_network_identifier)
    {
        [_var_visited_network_identifier beforeEncode];
        [arr addObject:_var_visited_network_identifier];
    }
    [self setArray:arr];
}


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            _var_context_identifier = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_context_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpServed_Party_IP_Address avpCode])
        {
            UMDiameterAvpServed_Party_IP_Address *avp2 = [[UMDiameterAvpServed_Party_IP_Address alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_served_party_ip_address == NULL)
            {
                _var_served_party_ip_address = @[avp2];
            }
            else
            {
                _var_served_party_ip_address = [_var_served_party_ip_address arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPDN_Type avpCode])
        {
            _var_pdn_type = [[UMDiameterAvpPDN_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pdn_type];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            _var_service_selection = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_selection];
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Subscribed_QoS_Profile avpCode])
        {
            _var_eps_subscribed_qos_profile = [[UMDiameterAvpEPS_Subscribed_QoS_Profile alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_eps_subscribed_qos_profile];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_Dynamic_Address_Allowed avpCode])
        {
            _var_vplmn_dynamic_address_allowed = [[UMDiameterAvpVPLMN_Dynamic_Address_Allowed alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vplmn_dynamic_address_allowed];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            _var_mip6_agent_info = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip6_agent_info];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            _var_visited_network_identifier = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_network_identifier];
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

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[context-identifier]",webName];
        [UMDiameterAvpContext_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[served-party-ip-address][]",webName];
        [UMDiameterAvpServed_Party_IP_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[pdn-type]",webName];
        [UMDiameterAvpPDN_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-selection]",webName];
        [UMDiameterAvpService_Selection appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[eps-subscribed-qos-profile]",webName];
        [UMDiameterAvpEPS_Subscribed_QoS_Profile appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vplmn-dynamic-address-allowed]",webName];
        [UMDiameterAvpVPLMN_Dynamic_Address_Allowed appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mip6-agent-info]",webName];
        [UMDiameterAvpMIP6_Agent_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[visited-network-identifier]",webName];
        [UMDiameterAvpVisited_Network_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Context-Identifier"] = [_var_context_identifier objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_served_party_ip_address.count>0)
		{
			for(UMDiameterAvp *avp in _var_served_party_ip_address)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Served-Party-IP-Address"] = arr;
		}
	}
	dict[@"PDN-Type"] = [_var_pdn_type objectValue];
	dict[@"Service-Selection"] = [_var_service_selection objectValue];
	dict[@"EPS-Subscribed-QoS-Profile"] = [_var_eps_subscribed_qos_profile objectValue];
	dict[@"VPLMN-Dynamic-Address-Allowed"] = [_var_vplmn_dynamic_address_allowed objectValue];
	dict[@"MIP6-Agent-Info"] = [_var_mip6_agent_info objectValue];
	dict[@"Visited-Network-Identifier"] = [_var_visited_network_identifier objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"apn-configuration";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpContext_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpServed_Party_IP_Address definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        def[@"maximum-count"]=@(2);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPDN_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Selection definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEPS_Subscribed_QoS_Profile definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVPLMN_Dynamic_Address_Allowed definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMIP6_Agent_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_Network_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

