//
//  UMDiameterPacketUpdate_Location_Answer.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 15:30:04.275000
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
@class UMDiameterAvpULA_Flags;
@class UMDiameterAvpSubscription_Data;
@class UMDiameterAvpReset_ID;
@class UMDiameterAvpAVP;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketUpdate_Location_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_session_id;
	UMDiameterAvpDRMP	*_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_vendor_specific_application_id;
	UMDiameterAvpResult_Code	*_result_code;
	UMDiameterAvpExperimental_Result	*_experimental_result;
	UMDiameterAvpError_Diagnostic	*_error_diagnostic;
	UMDiameterAvpAuth_Session_State	*_auth_session_state;
	UMDiameterAvpOrigin_Host	*_origin_host;
	UMDiameterAvpOrigin_Realm	*_origin_realm;
	UMDiameterAvpOC_Supported_Features	*_oc_supported_features;
	UMDiameterAvpOC_OLR	*_oc_olr;
	NSArray<UMDiameterAvpLoad *>	*_load;
	NSArray<UMDiameterAvpSupported_Features *>	*_supported_features;
	UMDiameterAvpULA_Flags	*_ula_flags;
	UMDiameterAvpSubscription_Data	*_subscription_data;
	NSArray<UMDiameterAvpReset_ID *>	*_reset_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
	UMDiameterAvpFailed_AVP	*_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_route_record;
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
@property(readwrite,strong,atomic)	UMDiameterAvpULA_Flags	*ula_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscription_Data	*subscription_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpReset_ID *>	*reset_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

