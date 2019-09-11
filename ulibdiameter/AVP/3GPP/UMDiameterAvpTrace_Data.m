//
//  UMDiameterAvpTrace_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


@end

