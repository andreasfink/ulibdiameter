//
//  UMDiameterPacketAlert_Service_Centre_Request.h
//  ulibdiameter
//
//  Created by afink on 2020-04-29 20:17:05.641134
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpSC_Address;
@class UMDiameterAvpUser_Identifier;
@class UMDiameterAvpSMSMI_Correlation_ID;
@class UMDiameterAvpMaximum_UE_Availability_Time;
@class UMDiameterAvpSMS_GMSC_Alert_Event;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketAlert_Service_Centre_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpSC_Address	*_var_sc_address;
	UMDiameterAvpUser_Identifier	*_var_user_identifier;
	UMDiameterAvpSMSMI_Correlation_ID	*_var_smsmi_correlation_id;
	UMDiameterAvpMaximum_UE_Availability_Time	*_var_maximum_ue_availability_time;
	UMDiameterAvpSMS_GMSC_Alert_Event	*_var_sms_gmsc_alert_event;
	UMDiameterAvpServing_Node	*_var_serving_node;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpSC_Address	*var_sc_address;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Identifier	*var_user_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpSMSMI_Correlation_ID	*var_smsmi_correlation_id;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_UE_Availability_Time	*var_maximum_ue_availability_time;
@property(readwrite,strong,atomic)	UMDiameterAvpSMS_GMSC_Alert_Event	*var_sms_gmsc_alert_event;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*var_serving_node;
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

