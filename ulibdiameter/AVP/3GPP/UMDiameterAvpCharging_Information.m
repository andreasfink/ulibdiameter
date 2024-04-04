//
//  UMDiameterAvpCharging_Information.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpCharging_Information.h>
#import <ulibdiameter/UMDiameterAvpPrimary_Event_Charging_Function_Name.h>
#import <ulibdiameter/UMDiameterAvpSecondary_Event_Charging_Function_Name.h>
#import <ulibdiameter/UMDiameterAvpPrimary_Charging_Collection_Function_Name.h>
#import <ulibdiameter/UMDiameterAvpSecondary_Charging_Collection_Function_Name.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpCharging_Information


- (NSString *)avpType
{
    return @"Charging-Information";
}

- (uint32_t)avpCode
{
    return 618;
}

+ (uint32_t)avpCode
{
    return 618;
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
    if(_var_primary_event_charging_function_name)
    {
        [_var_primary_event_charging_function_name beforeEncode];
        [arr addObject:_var_primary_event_charging_function_name];
    }
    if(_var_secondary_event_charging_function_name)
    {
        [_var_secondary_event_charging_function_name beforeEncode];
        [arr addObject:_var_secondary_event_charging_function_name];
    }
    if(_var_primary_charging_collection_function_name)
    {
        [_var_primary_charging_collection_function_name beforeEncode];
        [arr addObject:_var_primary_charging_collection_function_name];
    }
    if(_var_secondary_charging_collection_function_name)
    {
        [_var_secondary_charging_collection_function_name beforeEncode];
        [arr addObject:_var_secondary_charging_collection_function_name];
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
        if(avp.avpCode == [UMDiameterAvpPrimary_Event_Charging_Function_Name  avpCode])
        {
            _var_primary_event_charging_function_name = [[UMDiameterAvpPrimary_Event_Charging_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_primary_event_charging_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSecondary_Event_Charging_Function_Name avpCode])
        {
            _var_secondary_event_charging_function_name = [[UMDiameterAvpSecondary_Event_Charging_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_secondary_event_charging_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpPrimary_Charging_Collection_Function_Name avpCode])
        {
            _var_primary_charging_collection_function_name = [[UMDiameterAvpPrimary_Charging_Collection_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_primary_charging_collection_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSecondary_Charging_Collection_Function_Name avpCode])
        {
            _var_secondary_charging_collection_function_name = [[UMDiameterAvpSecondary_Charging_Collection_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_secondary_charging_collection_function_name];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[primary-event-charging-function-name]",webName];
        [UMDiameterAvpPrimary_Event_Charging_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[secondary-event-charging-function-name]",webName];
        [UMDiameterAvpSecondary_Event_Charging_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[primary-charging-collection-function-name]",webName];
        [UMDiameterAvpPrimary_Charging_Collection_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[secondary-charging-collection-function-name]",webName];
        [UMDiameterAvpSecondary_Charging_Collection_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Primary-Event-Charging-Function-Name"] = [_var_primary_event_charging_function_name objectValue];
	dict[@"Secondary-Event-Charging-Function-Name"] = [_var_secondary_event_charging_function_name objectValue];
	dict[@"Primary-Charging-Collection-Function-Name"] = [_var_primary_charging_collection_function_name objectValue];
	dict[@"Secondary-Charging-Collection-Function-Name"] = [_var_secondary_charging_collection_function_name objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"charging-information";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPrimary_Event_Charging_Function_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSecondary_Event_Charging_Function_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPrimary_Charging_Collection_Function_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSecondary_Charging_Collection_Function_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

