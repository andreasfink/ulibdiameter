//
//  UMDiameterPacketAuthentication_Information_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-09-10 14:16:02.851000
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
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpRequested_EUTRAN_Authentication_Info;
@class UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info;
@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAIR_Flags;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketAuthentication_Information_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpOC_Supported_Features	*_var_oc_supported_features;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpRequested_EUTRAN_Authentication_Info	*_var_requested_eutran_authentication_info;
	UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info	*_var_requested_utran_geran_authentication_info;
	UMDiameterAvpVisited_PLMN_Id	*_var_visited_plmn_id;
	UMDiameterAvpAIR_Flags	*_var_air_flags;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*oc_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpRequested_EUTRAN_Authentication_Info	*requested_eutran_authentication_info;
@property(readwrite,strong,atomic)	UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info	*requested_utran_geran_authentication_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*visited_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAIR_Flags	*air_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

