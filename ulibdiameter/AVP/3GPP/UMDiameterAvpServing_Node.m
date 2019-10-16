//
//  UMDiameterAvpServing_Node.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpSGSN_Number.h"
#import "UMDiameterAvpSGSN_Name.h"
#import "UMDiameterAvpSGSN_Realm.h"
#import "UMDiameterAvpMME_Name.h"
#import "UMDiameterAvpMME_Realm.h"
#import "UMDiameterAvpMSC_Number.h"
#import "UMDiameterAvp3GPP_AAA_Server_Name.h"
#import "UMDiameterAvpLCS_Capabilities_Sets.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpServing_Node


- (NSString *)avpType
{
    return @"Serving-Node";
}

- (uint32_t)avpCode
{
    return 2401;
}

+ (uint32_t)avpCode
{
    return 2401;
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
    if(_var_mme_name)
    {
        [_var_mme_name beforeEncode];
        [arr addObject:_var_mme_name];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-name]",webName];
        [UMDiameterAvpSGSN_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-realm]",webName];
        [UMDiameterAvpSGSN_Realm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-name]",webName];
        [UMDiameterAvpMME_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SGSN-Number"] = [_var_sgsn_number objectValue];
	dict[@"SGSN-Name"] = [_var_sgsn_name objectValue];
	dict[@"SGSN-Realm"] = [_var_sgsn_realm objectValue];
	dict[@"MME-Name"] = [_var_mme_name objectValue];
	dict[@"MME-Realm"] = [_var_mme_realm objectValue];
	dict[@"MSC-Number"] = [_var_msc_number objectValue];
	dict[@"3GPP-AAA-Server-Name"] = [_var_3gpp_aaa_server_name objectValue];
	dict[@"LCS-Capabilities-Sets"] = [_var_lcs_capabilities_sets objectValue];
	dict[@"GMLC-Address"] = [_var_gmlc_address objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"serving-node";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpSGSN_Number definition]];
    [entries addObject:[UMDiameterAvpSGSN_Name definition]];
    [entries addObject:[UMDiameterAvpSGSN_Realm definition]];
    [entries addObject:[UMDiameterAvpMME_Name definition]];
    [entries addObject:[UMDiameterAvpMME_Realm definition]];
    [entries addObject:[UMDiameterAvpMSC_Number definition]];
    [entries addObject:[UMDiameterAvp3GPP_AAA_Server_Name definition]];
    [entries addObject:[UMDiameterAvpLCS_Capabilities_Sets definition]];
    [entries addObject:[UMDiameterAvpGMLC_Address definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

