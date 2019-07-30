//
//  UMDiameterPacketUpdate_Location_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-07-30 16:47:41.765000
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
@class UMDiameterAvpTerminal_Information;
@class UMDiameterAvpRAT_Type;
@class UMDiameterAvpULR_Flags;
@class UMDiameterAvpUE_SRVCC_Capability;
@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpSGSN_Number;
@class UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions;
@class UMDiameterAvpGMLC_Address;
@class UMDiameterAvpActive_APN;
@class UMDiameterAvpEquivalent_PLMN_List;
@class UMDiameterAvpMME_Number_for_MT_SMS;
@class UMDiameterAvpSMS_Register_Request;
@class UMDiameterAvpSGs_MME_Identity;
@class UMDiameterAvpCoupled_Node_Diameter_ID;
@class UMDiameterAvpAdjacent_PLMNs;
@class UMDiameterAvpSupported_Services;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketUpdate_Location_Request : UMDiameterPacket
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
	UMDiameterAvpTerminal_Information	*_var_terminal_information;
	UMDiameterAvpRAT_Type	*_var_rat_type;
	UMDiameterAvpULR_Flags	*_var_ulr_flags;
	UMDiameterAvpUE_SRVCC_Capability	*_var_ue_srvcc_capability;
	UMDiameterAvpVisited_PLMN_Id	*_var_visited_plmn_id;
	UMDiameterAvpSGSN_Number	*_var_sgsn_number;
	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*_var_homogeneous_support_of_ims_voice_over_ps_sessions;
	UMDiameterAvpGMLC_Address	*_var_gmlc_address;
	NSArray<UMDiameterAvpActive_APN *>	*_var_active_apn;
	UMDiameterAvpEquivalent_PLMN_List	*_var_equivalent_plmn_list;
	UMDiameterAvpMME_Number_for_MT_SMS	*_var_mme_number_for_mt_sms;
	UMDiameterAvpSMS_Register_Request	*_var_sms_register_request;
	UMDiameterAvpSGs_MME_Identity	*_var_sgs_mme_identity;
	UMDiameterAvpCoupled_Node_Diameter_ID	*_var_coupled_node_diameter_id;
	UMDiameterAvpAdjacent_PLMNs	*_var_adjacent_plmns;
	UMDiameterAvpSupported_Services	*_var_supported_services;
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
@property(readwrite,strong,atomic)	UMDiameterAvpTerminal_Information	*terminal_information;
@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Type	*rat_type;
@property(readwrite,strong,atomic)	UMDiameterAvpULR_Flags	*ulr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_SRVCC_Capability	*ue_srvcc_capability;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*visited_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Number	*sgsn_number;
@property(readwrite,strong,atomic)	UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions	*homogeneous_support_of_ims_voice_over_ps_sessions;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Address	*gmlc_address;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpActive_APN *>	*active_apn;
@property(readwrite,strong,atomic)	UMDiameterAvpEquivalent_PLMN_List	*equivalent_plmn_list;
@property(readwrite,strong,atomic)	UMDiameterAvpMME_Number_for_MT_SMS	*mme_number_for_mt_sms;
@property(readwrite,strong,atomic)	UMDiameterAvpSMS_Register_Request	*sms_register_request;
@property(readwrite,strong,atomic)	UMDiameterAvpSGs_MME_Identity	*sgs_mme_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpCoupled_Node_Diameter_ID	*coupled_node_diameter_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAdjacent_PLMNs	*adjacent_plmns;
@property(readwrite,strong,atomic)	UMDiameterAvpSupported_Services	*supported_services;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

