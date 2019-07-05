//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.h
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.857000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported;
@class UMDiameterAvpLast_UE_Activity_Time;
@class UMDiameterAvpRAT_Type;
@class UMDiameterAvpIDA_Flags;
@class UMDiameterAvpEPS_User_State;
@class UMDiameterAvpEPS_Location_Information;
@class UMDiameterAvpLocal_Time_Zone;
@class UMDiameterAvpSupported_Services;
@class UMDiameterAvpMonitoring_Event_Report;
@class UMDiameterAvpMonitoring_Event_Config_Status;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketInsert_Subscriber_Data_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_varsession_id;
	UMDiameterAvpDRMP	*_vardrmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_varvendor_specific_application_id;
	NSArray<UMDiameterAvpSupported_Features *>	*_varsupported_features;
	UMDiameterAvpResult_Code	*_varresult_code;
	UMDiameterAvpExperimental_Result	*_varexperimental_result;
	UMDiameterAvpAuth_Session_State	*_varauth_session_state;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported	*_varims_voice_over_ps_sessions_supported;
	UMDiameterAvpLast_UE_Activity_Time	*_varlast_ue_activity_time;
	UMDiameterAvpRAT_Type	*_varrat_type;
	UMDiameterAvpIDA_Flags	*_varida_flags;
	UMDiameterAvpEPS_User_State	*_vareps_user_state;
	UMDiameterAvpEPS_Location_Information	*_vareps_location_information;
	UMDiameterAvpLocal_Time_Zone	*_varlocal_time_zone;
	UMDiameterAvpSupported_Services	*_varsupported_services;
	NSArray<UMDiameterAvpMonitoring_Event_Report *>	*_varmonitoring_event_report;
	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*_varmonitoring_event_config_status;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
	UMDiameterAvpFailed_AVP	*_varfailed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_varproxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_varroute_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported	*ims_voice_over_ps_sessions_supported;
@property(readwrite,strong,atomic)	UMDiameterAvpLast_UE_Activity_Time	*last_ue_activity_time;
@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Type	*rat_type;
@property(readwrite,strong,atomic)	UMDiameterAvpIDA_Flags	*ida_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_User_State	*eps_user_state;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Location_Information	*eps_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpLocal_Time_Zone	*local_time_zone;
@property(readwrite,strong,atomic)	UMDiameterAvpSupported_Services	*supported_services;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Report *>	*monitoring_event_report;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*monitoring_event_config_status;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

