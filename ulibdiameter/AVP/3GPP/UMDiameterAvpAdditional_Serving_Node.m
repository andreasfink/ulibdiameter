//
//  UMDiameterAvpAdditional_Serving_Node.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdditional_Serving_Node.h"
#import "UMDiameterAvpSGSN_Number.h"
#import "UMDiameterAvpMME_Name.h"
#import "UMDiameterAvpSGSN_Name.h"
#import "UMDiameterAvpSGSN_Realm.h"
#import "UMDiameterAvpMME_Realm.h"
#import "UMDiameterAvpMSC_Number.h"
#import "UMDiameterAvp3GPP_AAA_Server_Name.h"
#import "UMDiameterAvpLCS_Capabilities_Sets.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAdditional_Serving_Node


- (NSString *)avpType
{
    return @"Additional-Serving-Node";
}

- (uint32_t)avpCode
{
    return 2406;
}

+ (uint32_t)avpCode
{
    return 2406;
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
    if(_var_sgsn_number)
    {
        [_var_sgsn_number beforeEncode];
        [arr addObject:_var_sgsn_number];
    }
    if(_var_mme_name)
    {
        [_var_mme_name beforeEncode];
        [arr addObject:_var_mme_name];
    }
    if(_var_sgsn_name)
    {
        [_var_sgsn_name beforeEncode];
        [arr addObject:_var_sgsn_name];
    }
    if(_var_sgsn_realm)
    {
        [_var_sgsn_realm beforeEncode];
        [arr addObject:_var_sgsn_realm];
    }
    if(_var_mme_realm)
    {
        [_var_mme_realm beforeEncode];
        [arr addObject:_var_mme_realm];
    }
    if(_var_msc_number)
    {
        [_var_msc_number beforeEncode];
        [arr addObject:_var_msc_number];
    }
    if(_var_3gpp_aaa_server_name)
    {
        [_var_3gpp_aaa_server_name beforeEncode];
        [arr addObject:_var_3gpp_aaa_server_name];
    }
    if(_var_lcs_capabilities_sets)
    {
        [_var_lcs_capabilities_sets beforeEncode];
        [arr addObject:_var_lcs_capabilities_sets];
    }
    if(_var_gmlc_address)
    {
        [_var_gmlc_address beforeEncode];
        [arr addObject:_var_gmlc_address];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-number]",webName];
        [UMDiameterAvpSGSN_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-name]",webName];
        [UMDiameterAvpMME_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-name]",webName];
        [UMDiameterAvpSGSN_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-realm]",webName];
        [UMDiameterAvpSGSN_Realm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-realm]",webName];
        [UMDiameterAvpMME_Realm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[msc-number]",webName];
        [UMDiameterAvpMSC_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[3gpp-aaa-server-name]",webName];
        [UMDiameterAvp3GPP_AAA_Server_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-capabilities-sets]",webName];
        [UMDiameterAvpLCS_Capabilities_Sets appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[gmlc-address]",webName];
        [UMDiameterAvpGMLC_Address appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

