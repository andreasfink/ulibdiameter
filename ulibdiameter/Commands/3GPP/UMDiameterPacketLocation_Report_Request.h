//
//  UMDiameterPacketLocation_Report_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:27.099000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpLocation_Event;
@class UMDiameterAvpLCS_EPS_Client_Name;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpIMEI;
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
@class UMDiameterAvpLCS_Service_Type_ID;
@class UMDiameterAvpPseudonym_Indicator;
@class UMDiameterAvpLCS_QoS_Class;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpLRR_Flags;
@class UMDiameterAvpLCS_Reference_Number;
@class UMDiameterAvpDeferred_MT_LR_Data;
@class UMDiameterAvpGMLC_Address;
@class UMDiameterAvpReporting_Amount;
@class UMDiameterAvpPeriodic_LDR_Information;
@class UMDiameterAvpESMLC_Cell_Info;
@class UMDiameterAvp1xRTT_RCID;
@class UMDiameterAvpDelayed_Location_Reporting_Data;
@class UMDiameterAvpCivic_Address;
@class UMDiameterAvpBarometric_Pressure;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketLocation_Report_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpLocation_Event	*_var_location_event;
	UMDiameterAvpLCS_EPS_Client_Name	*_var_lcs_eps_client_name;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpIMEI	*_var_imei;
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
	UMDiameterAvpLCS_Service_Type_ID	*_var_lcs_service_type_id;
	UMDiameterAvpPseudonym_Indicator	*_var_pseudonym_indicator;
	UMDiameterAvpLCS_QoS_Class	*_var_lcs_qos_class;
	UMDiameterAvpServing_Node	*_var_serving_node;
	UMDiameterAvpLRR_Flags	*_var_lrr_flags;
	UMDiameterAvpLCS_Reference_Number	*_var_lcs_reference_number;
	UMDiameterAvpDeferred_MT_LR_Data	*_var_deferred_mt_lr_data;
	UMDiameterAvpGMLC_Address	*_var_gmlc_address;
	UMDiameterAvpReporting_Amount	*_var_reporting_amount;
	UMDiameterAvpPeriodic_LDR_Information	*_var_periodic_ldr_information;
	UMDiameterAvpESMLC_Cell_Info	*_var_esmlc_cell_info;
	UMDiameterAvp1xRTT_RCID	*_var_1xrtt_rcid;
	UMDiameterAvpDelayed_Location_Reporting_Data	*_var_delayed_location_reporting_data;
	UMDiameterAvpCivic_Address	*_var_civic_address;
	UMDiameterAvpBarometric_Pressure	*_var_barometric_pressure;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Event	*var_location_event;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_EPS_Client_Name	*var_lcs_eps_client_name;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*var_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpIMEI	*var_imei;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Estimate	*var_location_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpAccuracy_Fulfilment_Indicator	*var_accuracy_fulfilment_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Estimate	*var_age_of_location_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpVelocity_Estimate	*var_velocity_estimate;
@property(readwrite,strong,atomic)	UMDiameterAvpEUTRAN_Positioning_Data	*var_eutran_positioning_data;
@property(readwrite,strong,atomic)	UMDiameterAvpECGI	*var_ecgi;
@property(readwrite,strong,atomic)	UMDiameterAvpGERAN_Positioning_Info	*var_geran_positioning_info;
@property(readwrite,strong,atomic)	UMDiameterAvpCell_Global_Identity	*var_cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpUTRAN_Positioning_Info	*var_utran_positioning_info;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Area_Identity	*var_service_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Service_Type_ID	*var_lcs_service_type_id;
@property(readwrite,strong,atomic)	UMDiameterAvpPseudonym_Indicator	*var_pseudonym_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_QoS_Class	*var_lcs_qos_class;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*var_serving_node;
@property(readwrite,strong,atomic)	UMDiameterAvpLRR_Flags	*var_lrr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Reference_Number	*var_lcs_reference_number;
@property(readwrite,strong,atomic)	UMDiameterAvpDeferred_MT_LR_Data	*var_deferred_mt_lr_data;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Address	*var_gmlc_address;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Amount	*var_reporting_amount;
@property(readwrite,strong,atomic)	UMDiameterAvpPeriodic_LDR_Information	*var_periodic_ldr_information;
@property(readwrite,strong,atomic)	UMDiameterAvpESMLC_Cell_Info	*var_esmlc_cell_info;
@property(readwrite,strong,atomic)	UMDiameterAvp1xRTT_RCID	*var_1xrtt_rcid;
@property(readwrite,strong,atomic)	UMDiameterAvpDelayed_Location_Reporting_Data	*var_delayed_location_reporting_data;
@property(readwrite,strong,atomic)	UMDiameterAvpCivic_Address	*var_civic_address;
@property(readwrite,strong,atomic)	UMDiameterAvpBarometric_Pressure	*var_barometric_pressure;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

