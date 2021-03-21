//
//  UMDiameterAvpSubscription_Data_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data_Deletion.h"
#import "UMDiameterAvpDSR_Flags.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpTrace_Reference.h"
#import "UMDiameterAvpTS_Code.h"
#import "UMDiameterAvpSS_Code.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSubscription_Data_Deletion


- (NSString *)avpType
{
    return @"Subscription-Data-Deletion";
}

- (uint32_t)avpCode
{
    return 1685;
}

+ (uint32_t)avpCode
{
    return 1685;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_dsr_flags)
    {
        [_var_dsr_flags beforeEncode];
        [arr addObject:_var_dsr_flags];
    }
    if(_var_scef_id)
    {
        [_var_scef_id beforeEncode];
        [arr addObject:_var_scef_id];
    }
    if(_var_context_identifier.count > 0)
    {
        for(UMDiameterAvpContext_Identifier *o in _var_context_identifier)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_trace_reference)
    {
        [_var_trace_reference beforeEncode];
        [arr addObject:_var_trace_reference];
    }
    if(_var_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _var_ts_code)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_ss_code.count > 0)
    {
        for(UMDiameterAvpSS_Code *o in _var_ss_code)
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
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpDSR_Flags  avpCode])
        {
            _var_dsr_flags = [[UMDiameterAvpDSR_Flags alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_dsr_flags];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            _var_scef_id = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_id];
        }
        else if(avp.avpCode == [UMDiameterAvpContext_Identifier avpCode])
        {
            UMDiameterAvpContext_Identifier *avp2 = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_context_identifier == NULL)
            {
                _var_context_identifier = @[avp2];
            }
            else
            {
                _var_context_identifier = [_var_context_identifier arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Reference avpCode])
        {
            _var_trace_reference = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_reference];
        }
        else if(avp.avpCode == [UMDiameterAvpTS_Code avpCode])
        {
            UMDiameterAvpTS_Code *avp2 = [[UMDiameterAvpTS_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_ts_code == NULL)
            {
                _var_ts_code = @[avp2];
            }
            else
            {
                _var_ts_code = [_var_ts_code arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Code avpCode])
        {
            UMDiameterAvpSS_Code *avp2 = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_ss_code == NULL)
            {
                _var_ss_code = @[avp2];
            }
            else
            {
                _var_ss_code = [_var_ss_code arrayByAddingObject:avp2];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[dsr-flags]",webName];
        [UMDiameterAvpDSR_Flags appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[context-identifier][]",webName];
        [UMDiameterAvpContext_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-reference]",webName];
        [UMDiameterAvpTrace_Reference appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ts-code][]",webName];
        [UMDiameterAvpTS_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ss-code][]",webName];
        [UMDiameterAvpSS_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"DSR-Flags"] = [_var_dsr_flags objectValue];
	dict[@"SCEF-ID"] = [_var_scef_id objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_context_identifier.count>0)
		{
			for(UMDiameterAvp *avp in _var_context_identifier)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Context-Identifier"] = arr;
		}
	}
	dict[@"Trace-Reference"] = [_var_trace_reference objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_ts_code.count>0)
		{
			for(UMDiameterAvp *avp in _var_ts_code)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"TS-Code"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_ss_code.count>0)
		{
			for(UMDiameterAvp *avp in _var_ss_code)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"SS-Code"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"subscription-data-deletion";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDSR_Flags definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpContext_Identifier definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Reference definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTS_Code definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSS_Code definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

