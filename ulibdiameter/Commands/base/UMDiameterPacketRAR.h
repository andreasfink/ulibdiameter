//
//  UMDiameterPacketRAR.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:32:33.717000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpRe_Auth_Request_Type;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketRAR : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpAuth_Application_Id	*_var_auth_application_id;
	UMDiameterAvpRe_Auth_Request_Type	*_var_re_auth_request_type;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Application_Id	*var_auth_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpRe_Auth_Request_Type	*var_re_auth_request_type;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*var_origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

