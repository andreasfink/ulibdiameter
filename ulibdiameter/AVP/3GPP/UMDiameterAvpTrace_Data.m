//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpTrace_Reference  avpCode])
        {
            _var_trace_reference = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_reference];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Depth avpCode])
        {
            _var_trace_depth = [[UMDiameterAvpTrace_Depth alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_depth];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_NE_Type_List avpCode])
        {
            _var_trace_ne_type_list = [[UMDiameterAvpTrace_NE_Type_List alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_ne_type_list];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Interface_List avpCode])
        {
            _var_trace_interface_list = [[UMDiameterAvpTrace_Interface_List alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_interface_list];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Event_List avpCode])
        {
            _var_trace_event_list = [[UMDiameterAvpTrace_Event_List alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_event_list];
        }
        else if(avp.avpCode == [UMDiameterAvpOMC_Id avpCode])
        {
            _var_omc_id = [[UMDiameterAvpOMC_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_omc_id];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Collection_Entity avpCode])
        {
            _var_trace_collection_entity = [[UMDiameterAvpTrace_Collection_Entity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_collection_entity];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_Configuration avpCode])
        {
            _var_mdt_configuration = [[UMDiameterAvpMDT_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mdt_configuration];
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

