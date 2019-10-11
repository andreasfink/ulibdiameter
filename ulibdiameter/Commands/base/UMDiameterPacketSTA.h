//
//  UMDiameterPacketSTA.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 06:37:24.733000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpClass;
@class UMDiameterAvpError_Message;
@class UMDiameterAvpError_Reporting_Host;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpRedirect_Host;
@class UMDiameterAvpRedirect_Host_Usage;
@class UMDiameterAvpRedirect_Max_Cache_Time;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketSTA : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpUser_Name	*_var_user_name;
	NSArray<UMDiameterAvpClass *>	*_var_class;
	UMDiameterAvpError_Message	*_var_error_message;
	UMDiameterAvpError_Reporting_Host	*_var_error_reporting_host;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	NSArray<UMDiameterAvpRedirect_Host *>	*_var_redirect_host;
	UMDiameterAvpRedirect_Host_Usage	*_var_redirect_host_usage;
	UMDiameterAvpRedirect_Max_Cache_Time	*_var_redirect_max_cache_time;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpClass *>	*var_class;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*var_error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Reporting_Host	*var_error_reporting_host;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*var_failed_avp;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*var_origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRedirect_Host *>	*var_redirect_host;
@property(readwrite,strong,atomic)	UMDiameterAvpRedirect_Host_Usage	*var_redirect_host_usage;
@property(readwrite,strong,atomic)	UMDiameterAvpRedirect_Max_Cache_Time	*var_redirect_max_cache_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

