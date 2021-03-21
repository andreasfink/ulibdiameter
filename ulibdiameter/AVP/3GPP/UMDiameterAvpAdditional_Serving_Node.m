//
//  UMDiameterAvpAdditional_Serving_Node.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSGSN_Number  avpCode])
        {
            _var_sgsn_number = [[UMDiameterAvpSGSN_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_number];
        }
        else if(avp.avpCode == [UMDiameterAvpMME_Name avpCode])
        {
            _var_mme_name = [[UMDiameterAvpMME_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mme_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_Name avpCode])
        {
            _var_sgsn_name = [[UMDiameterAvpSGSN_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_Realm avpCode])
        {
            _var_sgsn_realm = [[UMDiameterAvpSGSN_Realm alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_realm];
        }
        else if(avp.avpCode == [UMDiameterAvpMME_Realm avpCode])
        {
            _var_mme_realm = [[UMDiameterAvpMME_Realm alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mme_realm];
        }
        else if(avp.avpCode == [UMDiameterAvpMSC_Number avpCode])
        {
            _var_msc_number = [[UMDiameterAvpMSC_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_msc_number];
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_AAA_Server_Name avpCode])
        {
            _var_3gpp_aaa_server_name = [[UMDiameterAvp3GPP_AAA_Server_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_3gpp_aaa_server_name];
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_Capabilities_Sets avpCode])
        {
            _var_lcs_capabilities_sets = [[UMDiameterAvpLCS_Capabilities_Sets alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lcs_capabilities_sets];
        }
        else if(avp.avpCode == [UMDiameterAvpGMLC_Address avpCode])
        {
            _var_gmlc_address = [[UMDiameterAvpGMLC_Address alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_gmlc_address];
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
    if(unknownAVPs.count>0)
    {
        _var_avp = unknownAVPs;
        [knownAVPs addObject:[_var_avp copy]];
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

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SGSN-Number"] = [_var_sgsn_number objectValue];
	dict[@"MME-Name"] = [_var_mme_name objectValue];
	dict[@"SGSN-Name"] = [_var_sgsn_name objectValue];
	dict[@"SGSN-Realm"] = [_var_sgsn_realm objectValue];
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
    avpDef[@"name"] = @"additional-serving-node";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMSC_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvp3GPP_AAA_Server_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLCS_Capabilities_Sets definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGMLC_Address definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

