//
//  UMDiameterAvpSIP_Auth_Data_Item.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
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
        [arr addObject:_var_sip_item_number];
    }
    if(_var_sip_authentication_scheme)
    {
        [arr addObject:_var_sip_authentication_scheme];
    }
    if(_var_sip_authorization)
    {
        [arr addObject:_var_sip_authorization];
    }
    if(_var_sip_authentication_context)
    {
        [arr addObject:_var_sip_authentication_context];
    }
    if(_var_integrity_key)
    {
        [arr addObject:_var_integrity_key];
    }
    if(_var_sip_digest_authenticate)
    {
        [arr addObject:_var_sip_digest_authenticate];
    }
    if(_var_framed_ip_address)
    {
        [arr addObject:_var_framed_ip_address];
    }
    if(_var_framed_ipv6_prefix)
    {
        [arr addObject:_var_framed_ipv6_prefix];
    }
    if(_var_framed_interface_id)
    {
        [arr addObject:_var_framed_interface_id];
    }
    if(_var_line_identifier.count > 0)
    {
        for(UMDiameterAvpLine_Identifier *o in _var_line_identifier)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
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
    [s appendString:@"<table class=\"avp-grouped\">\n"];
    [s appendFormat:@"<td>%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sip-item-number",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSIP_Item_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sip-authentication-scheme",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSIP_Authentication_Scheme appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sip-authorization",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSIP_Authorization appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sip-authentication-context",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSIP_Authentication_Context appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.integrity-key",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpIntegrity_Key appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sip-digest-authenticate",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSIP_Digest_Authenticate appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.framed-ip-address",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpFramed_IP_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.framed-ipv6-prefix",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpFramed_IPv6_Prefix appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.framed-interface-id",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpFramed_Interface_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[].line-identifier",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpLine_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[].avp",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpAVP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
    [s appendString:@"</td>\n"];
    [s appendString:@"</table>\n"];
    [s appendString:@"</tr>\n"];
}

@end

