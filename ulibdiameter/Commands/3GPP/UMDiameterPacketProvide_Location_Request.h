//
//  UMDiameterPacketProvide_Location_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:15:40.079000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpSLg_Location_Type;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpIMEI;
@class UMDiameterAvpLCS_EPS_Client_Name;
@class UMDiameterAvpLCS_Client_Type;
@class UMDiameterAvpLCS_Requestor_Name;
@class UMDiameterAvpLCS_Priority;
@class UMDiameterAvpLCS_QoS;
@class UMDiameterAvpVelocity_Requested;
@class UMDiameterAvpLCS_Supported_GAD_Shapes;
@class UMDiameterAvpLCS_Service_Type_ID;
@class UMDiameterAvpLCS_Codeword;
@class UMDiameterAvpLCS_Privacy_Check_Non_Session;
@class UMDiameterAvpLCS_Privacy_Check_Session;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpDeferred_Location_Type;
@class UMDiameterAvpPLR_Flags;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketProvide_Location_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpSLg_Location_Type	*_var_slg_location_type;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpIMEI	*_var_imei;
	UMDiameterAvpLCS_EPS_Client_Name	*_var_lcs_eps_client_name;
	UMDiameterAvpLCS_Client_Type	*_var_lcs_client_type;
	UMDiameterAvpLCS_Requestor_Name	*_var_lcs_requestor_name;
	UMDiameterAvpLCS_Priority	*_var_lcs_priority;
	UMDiameterAvpLCS_QoS	*_var_lcs_qos;
	UMDiameterAvpVelocity_Requested	*_var_velocity_requested;
	UMDiameterAvpLCS_Supported_GAD_Shapes	*_var_lcs_supported_gad_shapes;
	UMDiameterAvpLCS_Service_Type_ID	*_var_lcs_service_type_id;
	UMDiameterAvpLCS_Codeword	*_var_lcs_codeword;
	UMDiameterAvpLCS_Privacy_Check_Non_Session	*_var_lcs_privacy_check_non_session;
	UMDiameterAvpLCS_Privacy_Check_Session	*_var_lcs_privacy_check_session;
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvpDeferred_Location_Type	*_var_deferred_location_type;
	UMDiameterAvpPLR_Flags	*_var_plr_flags;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpSLg_Location_Type	*slg_location_type;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpIMEI	*imei;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_EPS_Client_Name	*lcs_eps_client_name;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Client_Type	*lcs_client_type;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Requestor_Name	*lcs_requestor_name;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Priority	*lcs_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_QoS	*lcs_qos;
@property(readwrite,strong,atomic)	UMDiameterAvpVelocity_Requested	*velocity_requested;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Supported_GAD_Shapes	*lcs_supported_gad_shapes;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Service_Type_ID	*lcs_service_type_id;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Codeword	*lcs_codeword;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Privacy_Check_Non_Session	*lcs_privacy_check_non_session;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Privacy_Check_Session	*lcs_privacy_check_session;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpDeferred_Location_Type	*deferred_location_type;
@property(readwrite,strong,atomic)	UMDiameterAvpPLR_Flags	*plr_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

