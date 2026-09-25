//
//  UMDiameterAvpLCS_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpLCS_Info.h>
#import <ulibdiameter/UMDiameterAvpGMLC_Number.h>
#import <ulibdiameter/UMDiameterAvpLCS_PrivacyException.h>
#import <ulibdiameter/UMDiameterAvpMO_LR.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpLCS_Info


- (NSString *)avpType
{
    return @"LCS-Info";
}

- (uint32_t)avpCode
{
    return 1473;
}

+ (uint32_t)avpCode
{
    return 1473;
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
    if(_var_gmlc_number.count > 0)
    {
        for(UMDiameterAvpGMLC_Number *o in _var_gmlc_number)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_lcs_privacyexception.count > 0)
    {
        for(UMDiameterAvpLCS_PrivacyException *o in _var_lcs_privacyexception)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_mo_lr.count > 0)
    {
        for(UMDiameterAvpMO_LR *o in _var_mo_lr)
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


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpGMLC_Number  avpCode])
        {
            UMDiameterAvpGMLC_Number *avp2 = [[UMDiameterAvpGMLC_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_gmlc_number == NULL)
            {
                _var_gmlc_number = @[avp2];
            }
            else
            {
                _var_gmlc_number = [_var_gmlc_number arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_PrivacyException avpCode])
        {
            UMDiameterAvpLCS_PrivacyException *avp2 = [[UMDiameterAvpLCS_PrivacyException alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_lcs_privacyexception == NULL)
            {
                _var_lcs_privacyexception = @[avp2];
            }
            else
            {
                _var_lcs_privacyexception = [_var_lcs_privacyexception arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMO_LR avpCode])
        {
            UMDiameterAvpMO_LR *avp2 = [[UMDiameterAvpMO_LR alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mo_lr == NULL)
            {
                _var_mo_lr = @[avp2];
            }
            else
            {
                _var_mo_lr = [_var_mo_lr arrayByAddingObject:avp2];
            }
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[gmlc-number][]",webName];
        [UMDiameterAvpGMLC_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-privacyexception][]",webName];
        [UMDiameterAvpLCS_PrivacyException appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mo-lr][]",webName];
        [UMDiameterAvpMO_LR appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_gmlc_number.count>0)
		{
			for(UMDiameterAvp *avp in _var_gmlc_number)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"GMLC-Number"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_lcs_privacyexception.count>0)
		{
			for(UMDiameterAvp *avp in _var_lcs_privacyexception)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"LCS-PrivacyException"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_mo_lr.count>0)
		{
			for(UMDiameterAvp *avp in _var_mo_lr)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"MO-LR"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"lcs-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGMLC_Number definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLCS_PrivacyException definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMO_LR definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

