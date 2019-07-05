//
//  UMDiameterPacketInsert_Subscriber_Data_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.872000
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
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpVPLMN_CSG_Subscription_Data;
@class UMDiameterAvpSubscription_Data;
@class UMDiameterAvpIDR_Flags;
@class UMDiameterAvpReset_ID;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketInsert_Subscriber_Data_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_varsession_id;
	UMDiameterAvpDRMP	*_vardrmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_varvendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_varauth_session_state;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	UMDiameterAvpDestination_Host	*_vardestination_host;
	UMDiameterAvpDestination_Realm	*_vardestination_realm;
	UMDiameterAvpUser_Name	*_varuser_name;
	NSArray<UMDiameterAvpSupported_Features *>	*_varsupported_features;
	NSArray<UMDiameterAvpVPLMN_CSG_Subscription_Data *>	*_varvplmn_csg_subscription_data;
	UMDiameterAvpSubscription_Data	*_varsubscription_data;
	UMDiameterAvpIDR_Flags	*_varidr_flags;
	NSArray<UMDiameterAvpReset_ID *>	*_varreset_id;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
	NSArray<UMDiameterAvpProxy_Info *>	*_varproxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_varroute_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*supported_features;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVPLMN_CSG_Subscription_Data *>	*vplmn_csg_subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscription_Data	*subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpIDR_Flags	*idr_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpReset_ID *>	*reset_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

