//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.h
//  ulibdiameter
//
//  Created by afink on 2021-03-22 09:26:30.921203
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
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported	*_var_ims_voice_over_ps_sessions_supported;
	UMDiameterAvpLast_UE_Activity_Time	*_var_last_ue_activity_time;
	UMDiameterAvpRAT_Type	*_var_rat_type;
	UMDiameterAvpIDA_Flags	*_var_ida_flags;
	UMDiameterAvpEPS_User_State	*_var_eps_user_state;
	UMDiameterAvpEPS_Location_Information	*_var_eps_location_information;
	UMDiameterAvpLocal_Time_Zone	*_var_local_time_zone;
	UMDiameterAvpSupported_Services	*_var_supported_services;
	NSArray<UMDiameterAvpMonitoring_Event_Report *>	*_var_monitoring_event_report;
	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*_var_monitoring_event_config_status;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*var_experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported	*var_ims_voice_over_ps_sessions_supported;
@property(readwrite,strong,atomic)	UMDiameterAvpLast_UE_Activity_Time	*var_last_ue_activity_time;
@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Type	*var_rat_type;
@property(readwrite,strong,atomic)	UMDiameterAvpIDA_Flags	*var_ida_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_User_State	*var_eps_user_state;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Location_Information	*var_eps_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpLocal_Time_Zone	*var_local_time_zone;
@property(readwrite,strong,atomic)	UMDiameterAvpSupported_Services	*var_supported_services;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Report *>	*var_monitoring_event_report;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>	*var_monitoring_event_config_status;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*var_failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

