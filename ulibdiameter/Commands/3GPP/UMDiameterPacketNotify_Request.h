//
//  UMDiameterPacketNotify_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:59:07.293000
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
	UMDiameterAvpSession_Id	*_varsession_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_varvendor_specific_application_id;
	UMDiameterAvpDRMP	*_vardrmp;
	UMDiameterAvpAuth_Session_State	*_varauth_session_state;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	UMDiameterAvpDestination_Host	*_vardestination_host;
	UMDiameterAvpDestination_Realm	*_vardestination_realm;
	UMDiameterAvpUser_Name	*_varuser_name;
	UMDiameterAvpOC_Supported_Features	*_varoc_supported_features;
	NSArray<UMDiameterAvpSupported_Features *>	*_varsupported_features;
	UMDiameterAvpTerminal_Information	*_varterminal_information;
	UMDiameterAvpMIP6_Agent_Info	*_varmip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_varvisited_network_identifier;
	UMDiameterAvpContext_Identifier	*_varcontext_identifier;
	UMDiameterAvpService_Selection	*_varservice_selection;
	UMDiameterAvpAlert_Reason	*_varalert_reason;
	UMDiameterAvpUE_SRVCC_Capability	*_varue_srvcc_capability;
	UMDiameterAvpNOR_Flags	*_varnor_flags;
	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*_varhomogeneous_support_of_ims_voice_over_ps_sessions;
	UMDiameterAvpMaximum_UE_Availability_Time	*_varmaximum_ue_availability_time;
	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*_varmonitoring_event_config_status;
	UMDiameterAvpEmergency_Services	*_varemergency_services;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
	NSArray<UMDiameterAvpProxy_Info *>	*_varproxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_varroute_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*oc_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpTerminal_Information	*terminal_information;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*visited_network_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpAlert_Reason	*alert_reason;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_SRVCC_Capability	*ue_srvcc_capability;
@property(readwrite,strong,atomic)	UMDiameterAvpNOR_Flags	*nor_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*homogeneous_support_of_ims_voice_over_ps_sessions;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_UE_Availability_Time	*maximum_ue_availability_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*monitoring_event_config_status;
@property(readwrite,strong,atomic)	UMDiameterAvpEmergency_Services	*emergency_services;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

