//
//  UMDiameterAvpT4_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpT4_Data.h>
#import <ulibdiameter/UMDiameterAvpHSS_Cause.h>
#import <ulibdiameter/UMDiameterAvpServing_Node.h>
#import <ulibdiameter/UMDiameterAvpAdditional_Serving_Node.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpT4_Data


- (NSString *)avpType
{
    return @"T4-Data";
}

- (uint32_t)avpCode
{
    return 3108;
}

+ (uint32_t)avpCode
{
    return 3108;
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
    if(_var_hss_cause)
    {
        [_var_hss_cause beforeEncode];
        [arr addObject:_var_hss_cause];
    }
    if(_var_serving_node)
    {
        [_var_serving_node beforeEncode];
        [arr addObject:_var_serving_node];
    }
    if(_var_additional_serving_node.count > 0)
    {
        for(UMDiameterAvpAdditional_Serving_Node *o in _var_additional_serving_node)
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
        if(avp.avpCode == [UMDiameterAvpHSS_Cause  avpCode])
        {
            _var_hss_cause = [[UMDiameterAvpHSS_Cause alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_hss_cause];
        }
        else if(avp.avpCode == [UMDiameterAvpServing_Node avpCode])
        {
            _var_serving_node = [[UMDiameterAvpServing_Node alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_serving_node];
        }
        else if(avp.avpCode == [UMDiameterAvpAdditional_Serving_Node avpCode])
        {
            UMDiameterAvpAdditional_Serving_Node *avp2 = [[UMDiameterAvpAdditional_Serving_Node alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_additional_serving_node == NULL)
            {
                _var_additional_serving_node = @[avp2];
            }
            else
            {
                _var_additional_serving_node = [_var_additional_serving_node arrayByAddingObject:avp2];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[hss-cause]",webName];
        [UMDiameterAvpHSS_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[serving-node]",webName];
        [UMDiameterAvpServing_Node appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[additional-serving-node][]",webName];
        [UMDiameterAvpAdditional_Serving_Node appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"HSS-Cause"] = [_var_hss_cause objectValue];
	dict[@"Serving-Node"] = [_var_serving_node objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_additional_serving_node.count>0)
		{
			for(UMDiameterAvp *avp in _var_additional_serving_node)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Additional-Serving-Node"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"t4-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpHSS_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpServing_Node definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAdditional_Serving_Node definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

