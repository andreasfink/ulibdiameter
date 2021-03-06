//
//  UMDiameterAvpReporting_PLMN_List.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_PLMN_List.h"
#import "UMDiameterAvpPLMN_ID_List.h"
#import "UMDiameterAvpPrioritized_List_Indicator.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpReporting_PLMN_List


- (NSString *)avpType
{
    return @"Reporting-PLMN-List";
}

- (uint32_t)avpCode
{
    return 2543;
}

+ (uint32_t)avpCode
{
    return 2543;
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
    if(_var_plmn_id_list.count > 0)
    {
        for(UMDiameterAvpPLMN_ID_List *o in _var_plmn_id_list)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_prioritized_list_indicator)
    {
        [_var_prioritized_list_indicator beforeEncode];
        [arr addObject:_var_prioritized_list_indicator];
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
        if(avp.avpCode == [UMDiameterAvpPLMN_ID_List  avpCode])
        {
            UMDiameterAvpPLMN_ID_List *avp2 = [[UMDiameterAvpPLMN_ID_List alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_plmn_id_list == NULL)
            {
                _var_plmn_id_list = @[avp2];
            }
            else
            {
                _var_plmn_id_list = [_var_plmn_id_list arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPrioritized_List_Indicator avpCode])
        {
            _var_prioritized_list_indicator = [[UMDiameterAvpPrioritized_List_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_prioritized_list_indicator];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[plmn-id-list][]",webName];
        [UMDiameterAvpPLMN_ID_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[prioritized-list-indicator]",webName];
        [UMDiameterAvpPrioritized_List_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_plmn_id_list.count>0)
		{
			for(UMDiameterAvp *avp in _var_plmn_id_list)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"PLMN-ID-List"] = arr;
		}
	}
	dict[@"Prioritized-List-Indicator"] = [_var_prioritized_list_indicator objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"reporting-plmn-list";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPLMN_ID_List definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        def[@"maximum-count"]=@(20);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPrioritized_List_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

