//
//  UMDiameterPacketProvide_Location_Answer.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:15:40.091000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpLocation_Estimate;
@class UMDiameterAvpAccuracy_Fulfilment_Indicator;
@class UMDiameterAvpAge_Of_Location_Estimate;
@class UMDiameterAvpVelocity_Estimate;
@class UMDiameterAvpEUTRAN_Positioning_Data;
@class UMDiameterAvpECGI;
@class UMDiameterAvpGERAN_Positioning_Info;
@class UMDiameterAvpCell_Global_Identity;
@class UMDiameterAvpUTRAN_Positioning_Info;
@class UMDiameterAvpService_Area_Identity;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpPLA_Flags;
@class UMDiameterAvpESMLC_Cell_Info;
@class UMDiameterAvpCivic_Address;
@class UMDiameterAvpBarometric_Pressure;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketProvide_Location_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpLocation_Estimate	*_var_location_estimate;
	UMDiameterAvpAccuracy_Fulfilment_Indicator	*_var_accuracy_fulfilment_indicator;
	UMDiameterAvpAge_Of_Location_Estimate	*_var_age_of_location_estimate;
	UMDiameterAvpVelocity_Estimate	*_var_velocity_estimate;
	UMDiameterAvpEUTRAN_Positioning_Data	*_var_eutran_positioning_data;
	UMDiameterAvpECGI	*_var_ecgi;
	UMDiameterAvpGERAN_Positioning_Info	*_var_geran_positioning_info;
	UMDiameterAvpCell_Global_Identity	*_var_cell_global_identity;
	UMDiameterAvpUTRAN_Positioning_Info	*_var_utran_positioning_info;
	UMDiameterAvpService_Area_Identity	*_var_service_area_identity;
	UMDiameterAvpServing_Node	*_var_serving_node;
	UMDiameterAvpPLA_Flags	*_var_pla_flags;
	UMDiameterAvpESMLC_Cell_Info	*_var_esmlc_cell_info;
	UMDiameterAvpCivic_Address	*_var_civic_address;
	UMDiameterAvpBarometric_Pressure	*_var_barometric_pressure;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Estimate	*location_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpAccuracy_Fulfilment_Indicator	*accuracy_fulfilment_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Estimate	*age_of_location_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpVelocity_Estimate	*velocity_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpEUTRAN_Positioning_Data	*eutran_positioning_data;
@property(readwrite,strong,atomic)	UMDiameterAvpECGI	*ecgi;
@property(readwrite,strong,atomic)	UMDiameterAvpGERAN_Positioning_Info	*geran_positioning_info;
@property(readwrite,strong,atomic)	UMDiameterAvpCell_Global_Identity	*cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpUTRAN_Positioning_Info	*utran_positioning_info;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Area_Identity	*service_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*serving_node;
@property(readwrite,strong,atomic)	UMDiameterAvpPLA_Flags	*pla_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpESMLC_Cell_Info	*esmlc_cell_info;
@property(readwrite,strong,atomic)	UMDiameterAvpCivic_Address	*civic_address;
@property(readwrite,strong,atomic)	UMDiameterAvpBarometric_Pressure	*barometric_pressure;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

