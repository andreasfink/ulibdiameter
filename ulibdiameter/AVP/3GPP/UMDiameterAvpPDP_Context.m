//
//  UMDiameterAvpPDP_Context.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDP_Context.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpPDP_Type.h"
#import "UMDiameterAvpPDP_Address.h"
#import "UMDiameterAvpQoS_Subscribed.h"
#import "UMDiameterAvpVPLMN_Dynamic_Address_Allowed.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvp3GPP_Charging_Characteristics.h"
#import "UMDiameterAvpExt_PDP_Type.h"
#import "UMDiameterAvpExt_PDP_Address.h"
#import "UMDiameterAvpAMBR.h"
#import "UMDiameterAvpAPN_OI_Replacement.h"
#import "UMDiameterAvpSIPTO_Permission.h"
#import "UMDiameterAvpLIPA_Permission.h"
#import "UMDiameterAvpRestoration_Priority.h"
#import "UMDiameterAvpSIPTO_Local_Network_Permission.h"
#import "UMDiameterAvpNon_IP_Data_Delivery_Mechanism.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpPDP_Context


- (NSString *)avpType
{
    return @"PDP-Context";
}

- (uint32_t)avpCode
{
    return 1469;
}

+ (uint32_t)avpCode
{
    return 1469;
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
    if(_var_pdp_type)
    {
        [_var_pdp_type beforeEncode];
        [arr addObject:_var_pdp_type];
    }
    if(_var_pdp_address)
    {
        [_var_pdp_address beforeEncode];
        [arr addObject:_var_pdp_address];
    }
    if(_var_qos_subscribed)
    {
        [_var_qos_subscribed beforeEncode];
        [arr addObject:_var_qos_subscribed];
    }
    if(_var_vplmn_dynamic_address_allowed)
    {
        [_var_vplmn_dynamic_address_allowed beforeEncode];
        [arr addObject:_var_vplmn_dynamic_address_allowed];
    }
    if(_var_service_selection)
    {
        [_var_service_selection beforeEncode];
        [arr addObject:_var_service_selection];
    }
    if(_var_3gpp_charging_characteristics)
    {
        [_var_3gpp_charging_characteristics beforeEncode];
        [arr addObject:_var_3gpp_charging_characteristics];
    }
    if(_var_ext_pdp_type)
    {
        [_var_ext_pdp_type beforeEncode];
        [arr addObject:_var_ext_pdp_type];
    }
    if(_var_ext_pdp_address)
    {
        [_var_ext_pdp_address beforeEncode];
        [arr addObject:_var_ext_pdp_address];
    }
    if(_var_ambr)
    {
        [_var_ambr beforeEncode];
        [arr addObject:_var_ambr];
    }
    if(_var_apn_oi_replacement)
    {
        [_var_apn_oi_replacement beforeEncode];
        [arr addObject:_var_apn_oi_replacement];
    }
    if(_var_sipto_permission)
    {
        [_var_sipto_permission beforeEncode];
        [arr addObject:_var_sipto_permission];
    }
    if(_var_lipa_permission)
    {
        [_var_lipa_permission beforeEncode];
        [arr addObject:_var_lipa_permission];
    }
    if(_var_restoration_priority)
    {
        [_var_restoration_priority beforeEncode];
        [arr addObject:_var_restoration_priority];
    }
    if(_var_sipto_local_network_permission)
    {
        [_var_sipto_local_network_permission beforeEncode];
        [arr addObject:_var_sipto_local_network_permission];
    }
    if(_var_non_ip_data_delivery_mechanism)
    {
        [_var_non_ip_data_delivery_mechanism beforeEncode];
        [arr addObject:_var_non_ip_data_delivery_mechanism];
    }
    if(_var_scef_id)
    {
        [_var_scef_id beforeEncode];
        [arr addObject:_var_scef_id];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[context-identifier]",webName];
        [UMDiameterAvpContext_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[pdp-type]",webName];
        [UMDiameterAvpPDP_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[pdp-address]",webName];
        [UMDiameterAvpPDP_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[qos-subscribed]",webName];
        [UMDiameterAvpQoS_Subscribed appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vplmn-dynamic-address-allowed]",webName];
        [UMDiameterAvpVPLMN_Dynamic_Address_Allowed appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-selection]",webName];
        [UMDiameterAvpService_Selection appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[3gpp-charging-characteristics]",webName];
        [UMDiameterAvp3GPP_Charging_Characteristics appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ext-pdp-type]",webName];
        [UMDiameterAvpExt_PDP_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ext-pdp-address]",webName];
        [UMDiameterAvpExt_PDP_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ambr]",webName];
        [UMDiameterAvpAMBR appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[apn-oi-replacement]",webName];
        [UMDiameterAvpAPN_OI_Replacement appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sipto-permission]",webName];
        [UMDiameterAvpSIPTO_Permission appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lipa-permission]",webName];
        [UMDiameterAvpLIPA_Permission appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[restoration-priority]",webName];
        [UMDiameterAvpRestoration_Priority appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sipto-local-network-permission]",webName];
        [UMDiameterAvpSIPTO_Local_Network_Permission appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[non-ip-data-delivery-mechanism]",webName];
        [UMDiameterAvpNon_IP_Data_Delivery_Mechanism appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Context-Identifier"] = [_var_context_identifier objectValue];
	dict[@"PDP-Type"] = [_var_pdp_type objectValue];
	dict[@"PDP-Address"] = [_var_pdp_address objectValue];
	dict[@"QoS-Subscribed"] = [_var_qos_subscribed objectValue];
	dict[@"VPLMN-Dynamic-Address-Allowed"] = [_var_vplmn_dynamic_address_allowed objectValue];
	dict[@"Service-Selection"] = [_var_service_selection objectValue];
	dict[@"3GPP-Charging-Characteristics"] = [_var_3gpp_charging_characteristics objectValue];
	dict[@"Ext-PDP-Type"] = [_var_ext_pdp_type objectValue];
	dict[@"Ext-PDP-Address"] = [_var_ext_pdp_address objectValue];
	dict[@"AMBR"] = [_var_ambr objectValue];
	dict[@"APN-OI-Replacement"] = [_var_apn_oi_replacement objectValue];
	dict[@"SIPTO-Permission"] = [_var_sipto_permission objectValue];
	dict[@"LIPA-Permission"] = [_var_lipa_permission objectValue];
	dict[@"Restoration-Priority"] = [_var_restoration_priority objectValue];
	dict[@"SIPTO-Local-Network-Permission"] = [_var_sipto_local_network_permission objectValue];
	dict[@"Non-IP-Data-Delivery-Mechanism"] = [_var_non_ip_data_delivery_mechanism objectValue];
	dict[@"SCEF-ID"] = [_var_scef_id objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"pdp-context";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpContext_Identifier definition]];
    [entries addObject:[UMDiameterAvpPDP_Type definition]];
    [entries addObject:[UMDiameterAvpPDP_Address definition]];
    [entries addObject:[UMDiameterAvpQoS_Subscribed definition]];
    [entries addObject:[UMDiameterAvpVPLMN_Dynamic_Address_Allowed definition]];
    [entries addObject:[UMDiameterAvpService_Selection definition]];
    [entries addObject:[UMDiameterAvp3GPP_Charging_Characteristics definition]];
    [entries addObject:[UMDiameterAvpExt_PDP_Type definition]];
    [entries addObject:[UMDiameterAvpExt_PDP_Address definition]];
    [entries addObject:[UMDiameterAvpAMBR definition]];
    [entries addObject:[UMDiameterAvpAPN_OI_Replacement definition]];
    [entries addObject:[UMDiameterAvpSIPTO_Permission definition]];
    [entries addObject:[UMDiameterAvpLIPA_Permission definition]];
    [entries addObject:[UMDiameterAvpRestoration_Priority definition]];
    [entries addObject:[UMDiameterAvpSIPTO_Local_Network_Permission definition]];
    [entries addObject:[UMDiameterAvpNon_IP_Data_Delivery_Mechanism definition]];
    [entries addObject:[UMDiameterAvpSCEF_ID definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

