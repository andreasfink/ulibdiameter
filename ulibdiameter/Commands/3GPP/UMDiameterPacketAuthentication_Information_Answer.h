//
//  UMDiameterPacketAuthentication_Information_Answer.h
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.788000
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
	UMDiameterAvpSession_Id	*_varsession_id;
	UMDiameterAvpDRMP	*_vardrmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_varvendor_specific_application_id;
	UMDiameterAvpResult_Code	*_varresult_code;
	UMDiameterAvpExperimental_Result	*_varexperimental_result;
	UMDiameterAvpError_Diagnostic	*_varerror_diagnostic;
	UMDiameterAvpAuth_Session_State	*_varauth_session_state;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	UMDiameterAvpOC_Supported_Features	*_varoc_supported_features;
	UMDiameterAvpOC_OLR	*_varoc_olr;
	NSArray<UMDiameterAvpLoad *>	*_varload;
	NSArray<UMDiameterAvpSupported_Features *>	*_varsupported_features;
	UMDiameterAvpAuthentication_Info	*_varauthentication_info;
	UMDiameterAvpUE_Usage_Type	*_varue_usage_type;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
	UMDiameterAvpFailed_AVP	*_varfailed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_varproxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_varroute_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Diagnostic	*error_diagnostic;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*oc_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_OLR	*oc_olr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLoad *>	*load;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpAuthentication_Info	*authentication_info;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_Usage_Type	*ue_usage_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

