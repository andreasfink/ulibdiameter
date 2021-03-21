//
//  UMDiameterAvpSM_Delivery_Outcome.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSM_Delivery_Outcome.h"
#import "UMDiameterAvpMME_SM_Delivery_Outcome.h"
#import "UMDiameterAvpMSC_SM_Delivery_Outcome.h"
#import "UMDiameterAvpSGSN_SM_Delivery_Outcome.h"
#import "UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSM_Delivery_Outcome


- (NSString *)avpType
{
    return @"SM-Delivery-Outcome";
}

- (uint32_t)avpCode
{
    return 3316;
}

+ (uint32_t)avpCode
{
    return 3316;
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
    if(_var_mme_sm_delivery_outcome)
    {
        [_var_mme_sm_delivery_outcome beforeEncode];
        [arr addObject:_var_mme_sm_delivery_outcome];
    }
    if(_var_msc_sm_delivery_outcome)
    {
        [_var_msc_sm_delivery_outcome beforeEncode];
        [arr addObject:_var_msc_sm_delivery_outcome];
    }
    if(_var_sgsn_sm_delivery_outcome)
    {
        [_var_sgsn_sm_delivery_outcome beforeEncode];
        [arr addObject:_var_sgsn_sm_delivery_outcome];
    }
    if(_var_ip_sm_gw_sm_delivery_outcome)
    {
        [_var_ip_sm_gw_sm_delivery_outcome beforeEncode];
        [arr addObject:_var_ip_sm_gw_sm_delivery_outcome];
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
        if(avp.avpCode == [UMDiameterAvpMME_SM_Delivery_Outcome  avpCode])
        {
            _var_mme_sm_delivery_outcome = [[UMDiameterAvpMME_SM_Delivery_Outcome alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mme_sm_delivery_outcome];
        }
        else if(avp.avpCode == [UMDiameterAvpMSC_SM_Delivery_Outcome avpCode])
        {
            _var_msc_sm_delivery_outcome = [[UMDiameterAvpMSC_SM_Delivery_Outcome alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_msc_sm_delivery_outcome];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_SM_Delivery_Outcome avpCode])
        {
            _var_sgsn_sm_delivery_outcome = [[UMDiameterAvpSGSN_SM_Delivery_Outcome alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_sm_delivery_outcome];
        }
        else if(avp.avpCode == [UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome avpCode])
        {
            _var_ip_sm_gw_sm_delivery_outcome = [[UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ip_sm_gw_sm_delivery_outcome];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-sm-delivery-outcome]",webName];
        [UMDiameterAvpMME_SM_Delivery_Outcome appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[msc-sm-delivery-outcome]",webName];
        [UMDiameterAvpMSC_SM_Delivery_Outcome appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-sm-delivery-outcome]",webName];
        [UMDiameterAvpSGSN_SM_Delivery_Outcome appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ip-sm-gw-sm-delivery-outcome]",webName];
        [UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"MME-SM-Delivery-Outcome"] = [_var_mme_sm_delivery_outcome objectValue];
	dict[@"MSC-SM-Delivery-Outcome"] = [_var_msc_sm_delivery_outcome objectValue];
	dict[@"SGSN-SM-Delivery-Outcome"] = [_var_sgsn_sm_delivery_outcome objectValue];
	dict[@"IP-SM-GW-SM-Delivery-Outcome"] = [_var_ip_sm_gw_sm_delivery_outcome objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sm-delivery-outcome";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_SM_Delivery_Outcome definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMSC_SM_Delivery_Outcome definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_SM_Delivery_Outcome definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

