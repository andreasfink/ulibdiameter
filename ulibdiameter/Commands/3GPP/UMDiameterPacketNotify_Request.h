//
//  UMDiameterPacketNotify_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:37:26.260000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpTerminal_Information;
@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpVisited_Network_Identifier;
@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpAlert_Reason;
@class UMDiameterAvpUE_SRVCC_Capability;
@class UMDiameterAvpNOR_Flags;
@class UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions;
@class UMDiameterAvpMaximum_UE_Availability_Time;
@class UMDiameterAvpMonitoring_Event_Config_Status;
@class UMDiameterAvpEmergency_Services;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketNotify_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpOC_Supported_Features	*_var_oc_supported_features;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpTerminal_Information	*_var_terminal_information;
	UMDiameterAvpMIP6_Agent_Info	*_var_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_var_visited_network_identifier;
	UMDiameterAvpContext_Identifier	*_var_context_identifier;
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvpAlert_Reason	*_var_alert_reason;
	UMDiameterAvpUE_SRVCC_Capability	*_var_ue_srvcc_capability;
	UMDiameterAvpNOR_Flags	*_var_nor_flags;
	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*_var_homogeneous_support_of_ims_voice_over_ps_sessions;
	UMDiameterAvpMaximum_UE_Availability_Time	*_var_maximum_ue_availability_time;
	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*_var_monitoring_event_config_status;
	UMDiameterAvpEmergency_Services	*_var_emergency_services;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*var_oc_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpTerminal_Information	*var_terminal_information;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*var_mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*var_visited_network_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*var_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpAlert_Reason	*var_alert_reason;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_SRVCC_Capability	*var_ue_srvcc_capability;
@property(readwrite,strong,atomic)	UMDiameterAvpNOR_Flags	*var_nor_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*var_homogeneous_support_of_ims_voice_over_ps_sessions;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_UE_Availability_Time	*var_maximum_ue_availability_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*var_monitoring_event_config_status;
@property(readwrite,strong,atomic)	UMDiameterAvpEmergency_Services	*var_emergency_services;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

