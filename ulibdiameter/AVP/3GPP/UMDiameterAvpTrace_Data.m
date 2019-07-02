//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Data.h"

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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpTrace_Reference  avpCode])
        {
            avp = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            _var_trace_reference = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Depth avpCode])
        {
            avp = [[UMDiameterAvpTrace_Depth alloc]initWithAvp:avp];
            _var_trace_depth = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_NE_Type_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_NE_Type_List alloc]initWithAvp:avp];
            _var_trace_ne_type_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Interface_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_Interface_List alloc]initWithAvp:avp];
            _var_trace_interface_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Event_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_Event_List alloc]initWithAvp:avp];
            _var_trace_event_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpOMC_Id avpCode])
        {
            avp = [[UMDiameterAvpOMC_Id alloc]initWithAvp:avp];
            _var_omc_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Collection_Entity avpCode])
        {
            avp = [[UMDiameterAvpTrace_Collection_Entity alloc]initWithAvp:avp];
            _var_trace_collection_entity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_Configuration avpCode])
        {
            avp = [[UMDiameterAvpMDT_Configuration alloc]initWithAvp:avp];
            _var_mdt_configuration = avp;
            [knownAVPs addObject:avp];
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

