//
//  UMDiameterPacketSubscribe_Notifications_Request.h
//  ulibdiameter
//
//  Created by afink on 2020-04-29 20:17:05.575075
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
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpUser_Identity;
@class UMDiameterAvpWildcarded_Public_Identity;
@class UMDiameterAvpService_Indication;
@class UMDiameterAvpSend_Data_Indication;
@class UMDiameterAvpServer_Name;
@class UMDiameterAvpSubs_Req_Type;
@class UMDiameterAvpData_Reference;
@class UMDiameterAvpIdentity_Set;
@class UMDiameterAvpExpiry_Time;
@class UMDiameterAvpDSAI_Tag;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketSubscribe_Notifications_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpUser_Identity	*_var_user_identity;
	UMDiameterAvpWildcarded_Public_Identity	*_var_wildcarded_public_identity;
	NSArray<UMDiameterAvpService_Indication *>	*_var_service_indication;
	UMDiameterAvpSend_Data_Indication	*_var_send_data_indication;
	UMDiameterAvpServer_Name	*_var_server_name;
	UMDiameterAvpSubs_Req_Type	*_var_subs_req_type;
	NSArray<UMDiameterAvpData_Reference *>	*_var_data_reference;
	NSArray<UMDiameterAvpIdentity_Set *>	*_var_identity_set;
	UMDiameterAvpExpiry_Time	*_var_expiry_time;
	NSArray<UMDiameterAvpDSAI_Tag *>	*_var_dsai_tag;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpOC_Supported_Features	*_var_oc_supported_features;
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
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Identity	*var_user_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpWildcarded_Public_Identity	*var_wildcarded_public_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Indication *>	*var_service_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpSend_Data_Indication	*var_send_data_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpServer_Name	*var_server_name;
@property(readwrite,strong,atomic)	UMDiameterAvpSubs_Req_Type	*var_subs_req_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpData_Reference *>	*var_data_reference;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpIdentity_Set *>	*var_identity_set;
@property(readwrite,strong,atomic)	UMDiameterAvpExpiry_Time	*var_expiry_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpDSAI_Tag *>	*var_dsai_tag;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*var_oc_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

