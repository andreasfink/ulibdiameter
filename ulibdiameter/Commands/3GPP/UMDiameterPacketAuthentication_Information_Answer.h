//
//  UMDiameterPacketAuthentication_Information_Answer.h
//  ulibdiameter
//
//  Created by afink on 2021-03-22 09:26:30.873900
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpError_Diagnostic;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpOC_OLR;
@class UMDiameterAvpLoad;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpAuthentication_Info;
@class UMDiameterAvpUE_Usage_Type;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketAuthentication_Information_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpError_Diagnostic	*_var_error_diagnostic;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpOC_Supported_Features	*_var_oc_supported_features;
	UMDiameterAvpOC_OLR	*_var_oc_olr;
	NSArray<UMDiameterAvpLoad *>	*_var_load;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpAuthentication_Info	*_var_authentication_info;
	UMDiameterAvpUE_Usage_Type	*_var_ue_usage_type;
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
@property(readwrite,strong,atomic)	UMDiameterAvpError_Diagnostic	*var_error_diagnostic;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*var_oc_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_OLR	*var_oc_olr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLoad *>	*var_load;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpAuthentication_Info	*var_authentication_info;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_Usage_Type	*var_ue_usage_type;
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

