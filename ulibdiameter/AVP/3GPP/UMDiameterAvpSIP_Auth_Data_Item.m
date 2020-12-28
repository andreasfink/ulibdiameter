//
//  UMDiameterAvpSIP_Auth_Data_Item.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:42:39.527659
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Auth_Data_Item.h"
#import "UMDiameterAvpSIP_Item_Number.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"
#import "UMDiameterAvpSIP_Authorization.h"
#import "UMDiameterAvpSIP_Authentication_Context.h"
#import "UMDiameterAvpIntegrity_Key.h"
#import "UMDiameterAvpSIP_Digest_Authenticate.h"
#import "UMDiameterAvpFramed_IP_Address.h"
#import "UMDiameterAvpFramed_IPv6_Prefix.h"
#import "UMDiameterAvpFramed_Interface_Id.h"
#import "UMDiameterAvpLine_Identifier.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSIP_Auth_Data_Item


- (NSString *)avpType
{
    return @"SIP-Auth-Data-Item";
}

- (uint32_t)avpCode
{
    return 612;
}

+ (uint32_t)avpCode
{
    return 612;
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
    if(_var_sip_item_number)
    {
        [_var_sip_item_number beforeEncode];
        [arr addObject:_var_sip_item_number];
    }
    if(_var_sip_authentication_scheme)
    {
        [_var_sip_authentication_scheme beforeEncode];
        [arr addObject:_var_sip_authentication_scheme];
    }
    if(_var_sip_authorization)
    {
        [_var_sip_authorization beforeEncode];
        [arr addObject:_var_sip_authorization];
    }
    if(_var_sip_authentication_context)
    {
        [_var_sip_authentication_context beforeEncode];
        [arr addObject:_var_sip_authentication_context];
    }
    if(_var_integrity_key)
    {
        [_var_integrity_key beforeEncode];
        [arr addObject:_var_integrity_key];
    }
    if(_var_sip_digest_authenticate)
    {
        [_var_sip_digest_authenticate beforeEncode];
        [arr addObject:_var_sip_digest_authenticate];
    }
    if(_var_framed_ip_address)
    {
        [_var_framed_ip_address beforeEncode];
        [arr addObject:_var_framed_ip_address];
    }
    if(_var_framed_ipv6_prefix)
    {
        [_var_framed_ipv6_prefix beforeEncode];
        [arr addObject:_var_framed_ipv6_prefix];
    }
    if(_var_framed_interface_id)
    {
        [_var_framed_interface_id beforeEncode];
        [arr addObject:_var_framed_interface_id];
    }
    if(_var_line_identifier.count > 0)
    {
        for(UMDiameterAvpLine_Identifier *o in _var_line_identifier)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-item-number]",webName];
        [UMDiameterAvpSIP_Item_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-authentication-scheme]",webName];
        [UMDiameterAvpSIP_Authentication_Scheme appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-authorization]",webName];
        [UMDiameterAvpSIP_Authorization appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-authentication-context]",webName];
        [UMDiameterAvpSIP_Authentication_Context appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[integrity-key]",webName];
        [UMDiameterAvpIntegrity_Key appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-digest-authenticate]",webName];
        [UMDiameterAvpSIP_Digest_Authenticate appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[framed-ip-address]",webName];
        [UMDiameterAvpFramed_IP_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[framed-ipv6-prefix]",webName];
        [UMDiameterAvpFramed_IPv6_Prefix appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[framed-interface-id]",webName];
        [UMDiameterAvpFramed_Interface_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[line-identifier][]",webName];
        [UMDiameterAvpLine_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SIP-Item-Number"] = [_var_sip_item_number objectValue];
	dict[@"SIP-Authentication-Scheme"] = [_var_sip_authentication_scheme objectValue];
	dict[@"SIP-Authorization"] = [_var_sip_authorization objectValue];
	dict[@"SIP-Authentication-Context"] = [_var_sip_authentication_context objectValue];
	dict[@"Integrity-Key"] = [_var_integrity_key objectValue];
	dict[@"SIP-Digest-Authenticate"] = [_var_sip_digest_authenticate objectValue];
	dict[@"Framed-IP-Address"] = [_var_framed_ip_address objectValue];
	dict[@"Framed-IPv6-Prefix"] = [_var_framed_ipv6_prefix objectValue];
	dict[@"Framed-Interface-Id"] = [_var_framed_interface_id objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_line_identifier.count>0)
		{
			for(UMDiameterAvp *avp in _var_line_identifier)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Line-Identifier"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sip-auth-data-item";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Item_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Authentication_Scheme definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Authorization definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Authentication_Context definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIntegrity_Key definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Digest_Authenticate definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpFramed_IP_Address definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpFramed_IPv6_Prefix definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpFramed_Interface_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLine_Identifier definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

