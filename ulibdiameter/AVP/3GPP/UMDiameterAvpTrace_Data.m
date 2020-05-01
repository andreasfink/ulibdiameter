//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Data.h"
#import "UMDiameterAvpTrace_Reference.h"
#import "UMDiameterAvpTrace_Depth.h"
#import "UMDiameterAvpTrace_NE_Type_List.h"
#import "UMDiameterAvpTrace_Interface_List.h"
#import "UMDiameterAvpTrace_Event_List.h"
#import "UMDiameterAvpOMC_Id.h"
#import "UMDiameterAvpTrace_Collection_Entity.h"
#import "UMDiameterAvpMDT_Configuration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpTrace_Data


- (NSString *)avpType
{
    return @"Trace-Data";
}

- (uint32_t)avpCode
{
    return 1458;
}

+ (uint32_t)avpCode
{
    return 1458;
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
    if(_var_trace_reference)
    {
        [_var_trace_reference beforeEncode];
        [arr addObject:_var_trace_reference];
    }
    if(_var_trace_depth)
    {
        [_var_trace_depth beforeEncode];
        [arr addObject:_var_trace_depth];
    }
    if(_var_trace_ne_type_list)
    {
        [_var_trace_ne_type_list beforeEncode];
        [arr addObject:_var_trace_ne_type_list];
    }
    if(_var_trace_interface_list)
    {
        [_var_trace_interface_list beforeEncode];
        [arr addObject:_var_trace_interface_list];
    }
    if(_var_trace_event_list)
    {
        [_var_trace_event_list beforeEncode];
        [arr addObject:_var_trace_event_list];
    }
    if(_var_omc_id)
    {
        [_var_omc_id beforeEncode];
        [arr addObject:_var_omc_id];
    }
    if(_var_trace_collection_entity)
    {
        [_var_trace_collection_entity beforeEncode];
        [arr addObject:_var_trace_collection_entity];
    }
    if(_var_mdt_configuration)
    {
        [_var_mdt_configuration beforeEncode];
        [arr addObject:_var_mdt_configuration];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-reference]",webName];
        [UMDiameterAvpTrace_Reference appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-depth]",webName];
        [UMDiameterAvpTrace_Depth appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-ne-type-list]",webName];
        [UMDiameterAvpTrace_NE_Type_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-interface-list]",webName];
        [UMDiameterAvpTrace_Interface_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-event-list]",webName];
        [UMDiameterAvpTrace_Event_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[omc-id]",webName];
        [UMDiameterAvpOMC_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-collection-entity]",webName];
        [UMDiameterAvpTrace_Collection_Entity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mdt-configuration]",webName];
        [UMDiameterAvpMDT_Configuration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Trace-Reference"] = [_var_trace_reference objectValue];
	dict[@"Trace-Depth"] = [_var_trace_depth objectValue];
	dict[@"Trace-NE-Type-List"] = [_var_trace_ne_type_list objectValue];
	dict[@"Trace-Interface-List"] = [_var_trace_interface_list objectValue];
	dict[@"Trace-Event-List"] = [_var_trace_event_list objectValue];
	dict[@"OMC-Id"] = [_var_omc_id objectValue];
	dict[@"Trace-Collection-Entity"] = [_var_trace_collection_entity objectValue];
	dict[@"MDT-Configuration"] = [_var_mdt_configuration objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"trace-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Reference definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Depth definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_NE_Type_List definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Interface_List definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Event_List definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOMC_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Collection_Entity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMDT_Configuration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

