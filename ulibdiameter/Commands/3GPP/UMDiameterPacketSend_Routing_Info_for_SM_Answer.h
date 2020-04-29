//
//  UMDiameterPacketSend_Routing_Info_for_SM_Answer.h
//  ulibdiameter
//
//  Created by afink on 2020-04-29 20:26:46.083644
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpAdditional_Serving_Node;
@class UMDiameterAvpLMSI;
@class UMDiameterAvpUser_Identifier;
@class UMDiameterAvpMWD_Status;
@class UMDiameterAvpMME_Absent_User_Diagnostic_SM;
@class UMDiameterAvpMSC_Absent_User_Diagnostic_SM;
@class UMDiameterAvpSGSN_Absent_User_Diagnostic_SM;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketSend_Routing_Info_for_SM_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpUser_Name	*_var_user_name;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpServing_Node	*_var_serving_node;
	UMDiameterAvpAdditional_Serving_Node	*_var_additional_serving_node;
	UMDiameterAvpLMSI	*_var_lmsi;
	UMDiameterAvpUser_Identifier	*_var_user_identifier;
	UMDiameterAvpMWD_Status	*_var_mwd_status;
	UMDiameterAvpMME_Absent_User_Diagnostic_SM	*_var_mme_absent_user_diagnostic_sm;
	UMDiameterAvpMSC_Absent_User_Diagnostic_SM	*_var_msc_absent_user_diagnostic_sm;
	UMDiameterAvpSGSN_Absent_User_Diagnostic_SM	*_var_sgsn_absent_user_diagnostic_sm;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*var_experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*var_serving_node;
@property(readwrite,strong,atomic)	UMDiameterAvpAdditional_Serving_Node	*var_additional_serving_node;
@property(readwrite,strong,atomic)	UMDiameterAvpLMSI	*var_lmsi;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Identifier	*var_user_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpMWD_Status	*var_mwd_status;
@property(readwrite,strong,atomic)	UMDiameterAvpMME_Absent_User_Diagnostic_SM	*var_mme_absent_user_diagnostic_sm;
@property(readwrite,strong,atomic)	UMDiameterAvpMSC_Absent_User_Diagnostic_SM	*var_msc_absent_user_diagnostic_sm;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Absent_User_Diagnostic_SM	*var_sgsn_absent_user_diagnostic_sm;
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

