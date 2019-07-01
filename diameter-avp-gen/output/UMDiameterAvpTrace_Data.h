//
//  UMDiameterAvpTrace_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
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
	UMDiameterAvpTrace_Reference	*_trace_reference;
	UMDiameterAvpTrace_Depth	*_trace_depth;
	UMDiameterAvpTrace_NE_Type_List	*_trace_ne_type_list;
	UMDiameterAvpTrace_Interface_List	*_trace_interface_list;
	UMDiameterAvpTrace_Event_List	*_trace_event_list;
	UMDiameterAvpOMC_Id	*_omc_id;
	UMDiameterAvpTrace_Collection_Entity	*_trace_collection_entity;
	UMDiameterAvpMDT_Configuration	*_mdt_configuration;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Reference	*trace_reference;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Depth	*trace_depth;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_NE_Type_List	*trace_ne_type_list;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Interface_List	*trace_interface_list;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Event_List	*trace_event_list;
@property(readwrite,strong,atomic)	UMDiameterAvpOMC_Id	*omc_id;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Collection_Entity	*trace_collection_entity;
@property(readwrite,strong,atomic)	UMDiameterAvpMDT_Configuration	*mdt_configuration;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

