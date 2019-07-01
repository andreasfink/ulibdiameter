//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_trace_reference)
    {
        [arr addObject:_trace_reference]
    }
    if(_trace_depth)
    {
        [arr addObject:_trace_depth]
    }
    if(_trace_ne_type_list)
    {
        [arr addObject:_trace_ne_type_list]
    }
    if(_trace_interface_list)
    {
        [arr addObject:_trace_interface_list]
    }
    if(_trace_event_list)
    {
        [arr addObject:_trace_event_list]
    }
    if(_omc_id)
    {
        [arr addObject:_omc_id]
    }
    if(_trace_collection_entity)
    {
        [arr addObject:_trace_collection_entity]
    }
    if(_mdt_configuration)
    {
        [arr addObject:_mdt_configuration]
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpTrace_Reference  avpCode])
        {
            avp = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            _trace_reference = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Depth avpCode])
        {
            avp = [[UMDiameterAvpTrace_Depth alloc]initWithAvp:avp];
            _trace_depth = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_NE_Type_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_NE_Type_List alloc]initWithAvp:avp];
            _trace_ne_type_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Interface_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_Interface_List alloc]initWithAvp:avp];
            _trace_interface_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Event_List avpCode])
        {
            avp = [[UMDiameterAvpTrace_Event_List alloc]initWithAvp:avp];
            _trace_event_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpOMC_Id avpCode])
        {
            avp = [[UMDiameterAvpOMC_Id alloc]initWithAvp:avp];
            _omc_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Collection_Entity avpCode])
        {
            avp = [[UMDiameterAvpTrace_Collection_Entity alloc]initWithAvp:avp];
            _trace_collection_entity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_Configuration avpCode])
        {
            avp = [[UMDiameterAvpMDT_Configuration alloc]initWithAvp:avp];
            _mdt_configuration = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

