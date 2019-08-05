//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
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
        [arr addObject:_var_trace_reference];
    }
    if(_var_trace_depth)
    {
        [arr addObject:_var_trace_depth];
    }
    if(_var_trace_ne_type_list)
    {
        [arr addObject:_var_trace_ne_type_list];
    }
    if(_var_trace_interface_list)
    {
        [arr addObject:_var_trace_interface_list];
    }
    if(_var_trace_event_list)
    {
        [arr addObject:_var_trace_event_list];
    }
    if(_var_omc_id)
    {
        [arr addObject:_var_omc_id];
    }
    if(_var_trace_collection_entity)
    {
        [arr addObject:_var_trace_collection_entity];
    }
    if(_var_mdt_configuration)
    {
        [arr addObject:_var_mdt_configuration];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
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
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][avp]",webName];
        [UMDiameterAvpAVP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

