//
//  UMDiameterPacketSTR.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.197000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpTermination_Cause;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpClass;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketSTR : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_session_id;
	UMDiameterAvpOrigin_Host	*_origin_host;
	UMDiameterAvpOrigin_Realm	*_origin_realm;
	UMDiameterAvpDestination_Realm	*_destination_realm;
	UMDiameterAvpAuth_Application_Id	*_auth_application_id;
	UMDiameterAvpTermination_Cause	*_termination_cause;
	UMDiameterAvpUser_Name	*_user_name;
	UMDiameterAvpDestination_Host	*_destination_host;
	NSArray<UMDiameterAvpClass *>	*_class;
	UMDiameterAvpOrigin_State_Id	*_origin_state_id;
	NSArray<UMDiameterAvpProxy_Info *>	*_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_route_record;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Application_Id	*auth_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpTermination_Cause	*termination_cause;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpClass *>	*class;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

@end

