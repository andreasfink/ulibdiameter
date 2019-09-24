//
//  UMDiameterPacketLCS_Routing_Info_Answer.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:15:40.068000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpLMSI;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpAdditional_Serving_Node;
@class UMDiameterAvpGMLC_Address;
@class UMDiameterAvpPPR_Address;
@class UMDiameterAvpRIA_Flags;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketLCS_Routing_Info_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpLMSI	*_var_lmsi;
	UMDiameterAvpServing_Node	*_var_serving_node;
	NSArray<UMDiameterAvpAdditional_Serving_Node *>	*_var_additional_serving_node;
	UMDiameterAvpGMLC_Address	*_var_gmlc_address;
	UMDiameterAvpPPR_Address	*_var_ppr_address;
	UMDiameterAvpRIA_Flags	*_var_ria_flags;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpLMSI	*lmsi;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*serving_node;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAdditional_Serving_Node *>	*additional_serving_node;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Address	*gmlc_address;
@property(readwrite,strong,atomic)	UMDiameterAvpPPR_Address	*ppr_address;
@property(readwrite,strong,atomic)	UMDiameterAvpRIA_Flags	*ria_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

