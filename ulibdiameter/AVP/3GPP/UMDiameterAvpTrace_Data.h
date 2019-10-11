//
//  UMDiameterAvpTrace_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTrace_Reference;
@class UMDiameterAvpTrace_Depth;
@class UMDiameterAvpTrace_NE_Type_List;
@class UMDiameterAvpTrace_Interface_List;
@class UMDiameterAvpTrace_Event_List;
@class UMDiameterAvpOMC_Id;
@class UMDiameterAvpTrace_Collection_Entity;
@class UMDiameterAvpMDT_Configuration;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpTrace_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpTrace_Reference	*_var_trace_reference;
	UMDiameterAvpTrace_Depth	*_var_trace_depth;
	UMDiameterAvpTrace_NE_Type_List	*_var_trace_ne_type_list;
	UMDiameterAvpTrace_Interface_List	*_var_trace_interface_list;
	UMDiameterAvpTrace_Event_List	*_var_trace_event_list;
	UMDiameterAvpOMC_Id	*_var_omc_id;
	UMDiameterAvpTrace_Collection_Entity	*_var_trace_collection_entity;
	UMDiameterAvpMDT_Configuration	*_var_mdt_configuration;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Reference	*var_trace_reference;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Depth	*var_trace_depth;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_NE_Type_List	*var_trace_ne_type_list;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Interface_List	*var_trace_interface_list;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Event_List	*var_trace_event_list;
@property(readwrite,strong,atomic)	UMDiameterAvpOMC_Id	*var_omc_id;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Collection_Entity	*var_trace_collection_entity;
@property(readwrite,strong,atomic)	UMDiameterAvpMDT_Configuration	*var_mdt_configuration;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

