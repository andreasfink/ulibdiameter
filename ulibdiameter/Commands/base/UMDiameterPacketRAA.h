//
//  UMDiameterPacketRAA.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.294000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpError_Message;
@class UMDiameterAvpError_Reporting_Host;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpRedirect_Host;
@class UMDiameterAvpRedirect_Host_Usage;
@class UMDiameterAvpRedirect_Max_Cache_Time;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketRAA : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_session_id;
	UMDiameterAvpResult_Code	*_result_code;
	UMDiameterAvpOrigin_Host	*_origin_host;
	UMDiameterAvpOrigin_Realm	*_origin_realm;
	UMDiameterAvpUser_Name	*_user_name;
	UMDiameterAvpOrigin_State_Id	*_origin_state_id;
	UMDiameterAvpError_Message	*_error_message;
	UMDiameterAvpError_Reporting_Host	*_error_reporting_host;
	UMDiameterAvpFailed_AVP	*_failed_avp;
	NSArray<UMDiameterAvpRedirect_Host *>	*_redirect_host;
	UMDiameterAvpRedirect_Host_Usage	*_redirect_host_usage;
	UMDiameterAvpRedirect_Max_Cache_Time	*_redirect_max_cache_time;
	NSArray<UMDiameterAvpProxy_Info *>	*_proxy_info;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Reporting_Host	*error_reporting_host;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRedirect_Host *>	*redirect_host;
@property(readwrite,strong,atomic)	UMDiameterAvpRedirect_Host_Usage	*redirect_host_usage;
@property(readwrite,strong,atomic)	UMDiameterAvpRedirect_Max_Cache_Time	*redirect_max_cache_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

@end

