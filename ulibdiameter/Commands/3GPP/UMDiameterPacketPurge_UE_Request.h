//
//  UMDiameterPacketPurge_UE_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:37:26.288000
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
@class UMDiameterAvpPUR_Flags;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpEPS_Location_Information;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketPurge_UE_Request : UMDiameterPacket
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
	UMDiameterAvpPUR_Flags	*_var_pur_flags;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpEPS_Location_Information	*_var_eps_location_information;
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
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*var_oc_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpPUR_Flags	*var_pur_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Location_Information	*var_eps_location_information;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

