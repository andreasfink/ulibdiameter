//
//  UMDiameterPacketSubscriber_Information_Answer.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 20:57:25.891631
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpDRMP;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpExperimental_Result;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpOC_Supported_Features;
@class UMDiameterAvpOC_OLR;
@class UMDiameterAvpLoad;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpUser_Identifier;
@class UMDiameterAvpService_Data;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketSubscriber_Information_Answer : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpExperimental_Result	*_var_experimental_result;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpOC_Supported_Features	*_var_oc_supported_features;
	UMDiameterAvpOC_OLR	*_var_oc_olr;
	NSArray<UMDiameterAvpLoad *>	*_var_load;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	NSArray<UMDiameterAvpUser_Identifier *>	*_var_user_identifier;
	UMDiameterAvpService_Data	*_var_service_data;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result	*var_experimental_result;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Supported_Features	*var_oc_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_OLR	*var_oc_olr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLoad *>	*var_load;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpUser_Identifier *>	*var_user_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Data	*var_service_data;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*var_failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

