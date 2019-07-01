//
//  UMDiameterPacketAuthentication_Information_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:41.648000
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
	UMDiameterAvpSession_Id	*_session_id;
	UMDiameterAvpDRMP	*_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_auth_session_state;
	UMDiameterAvpOrigin_Host	*_origin_host;
	UMDiameterAvpOrigin_Realm	*_origin_realm;
	UMDiameterAvpDestination_Host	*_destination_host;
	UMDiameterAvpDestination_Realm	*_destination_realm;
	UMDiameterAvpUser_Name	*_user_name;
	UMDiameterAvpOC_Supported_Features	*_oc_supported_features;
	NSArray<UMDiameterAvpSupported_Features *>	*_supported_features;
	UMDiameterAvpRequested_EUTRAN_Authentication_Info	*_requested_eutran_authentication_info;
	UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info	*_requested_utran_geran_authentication_info;
	UMDiameterAvpVisited_PLMN_Id	*_visited_plmn_id;
	UMDiameterAvpAIR_Flags	*_air_flags;
	NSArray<UMDiameterAvpAVP *>	*_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_route_record;
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

@end

