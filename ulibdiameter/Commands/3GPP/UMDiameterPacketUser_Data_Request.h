//
//  UMDiameterPacketUser_Data_Request.h
//  ulibdiameter
//
//  Created by afink on 2020-04-29 20:17:05.506261
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
@class UMDiameterAvpWildcarded_IMPU;
@class UMDiameterAvpServer_Name;
@class UMDiameterAvpService_Indication;
@class UMDiameterAvpData_Reference;
@class UMDiameterAvpIdentity_Set;
@class UMDiameterAvpRequested_Domain;
@class UMDiameterAvpCurrent_Location;
@class UMDiameterAvpDSAI_Tag;
@class UMDiameterAvpSession_Priority;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpRequested_Nodes;
@class UMDiameterAvpServing_Node_Indication;
@class UMDiameterAvpPre_paging_Supported;
@class UMDiameterAvpLocal_Time_Zone_Indication;
@class UMDiameterAvpCall_Reference_Info;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketUser_Data_Request : UMDiameterPacket
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
	UMDiameterAvpWildcarded_IMPU	*_var_wildcarded_impu;
	UMDiameterAvpServer_Name	*_var_server_name;
	NSArray<UMDiameterAvpService_Indication *>	*_var_service_indication;
	NSArray<UMDiameterAvpData_Reference *>	*_var_data_reference;
	NSArray<UMDiameterAvpIdentity_Set *>	*_var_identity_set;
	UMDiameterAvpRequested_Domain	*_var_requested_domain;
	UMDiameterAvpCurrent_Location	*_var_current_location;
	NSArray<UMDiameterAvpDSAI_Tag *>	*_var_dsai_tag;
	UMDiameterAvpSession_Priority	*_var_session_priority;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpRequested_Nodes	*_var_requested_nodes;
	UMDiameterAvpServing_Node_Indication	*_var_serving_node_indication;
	UMDiameterAvpPre_paging_Supported	*_var_pre_paging_supported;
	UMDiameterAvpLocal_Time_Zone_Indication	*_var_local_time_zone_indication;
	UMDiameterAvpCall_Reference_Info	*_var_call_reference_info;
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
@property(readwrite,strong,atomic)	UMDiameterAvpWildcarded_IMPU	*var_wildcarded_impu;
@property(readwrite,strong,atomic)	UMDiameterAvpServer_Name	*var_server_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Indication *>	*var_service_indication;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpData_Reference *>	*var_data_reference;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpIdentity_Set *>	*var_identity_set;
@property(readwrite,strong,atomic)	UMDiameterAvpRequested_Domain	*var_requested_domain;
@property(readwrite,strong,atomic)	UMDiameterAvpCurrent_Location	*var_current_location;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpDSAI_Tag *>	*var_dsai_tag;
@property(readwrite,strong,atomic)	UMDiameterAvpSession_Priority	*var_session_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpRequested_Nodes	*var_requested_nodes;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node_Indication	*var_serving_node_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpPre_paging_Supported	*var_pre_paging_supported;
@property(readwrite,strong,atomic)	UMDiameterAvpLocal_Time_Zone_Indication	*var_local_time_zone_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpCall_Reference_Info	*var_call_reference_info;
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

