//
//  UMDiameterPacketDelete_Subscriber_Data_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.901000
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
@class UMDiameterAvpDSR_Flags;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpTrace_Reference;
@class UMDiameterAvpTS_Code;
@class UMDiameterAvpSS_Code;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketDelete_Subscriber_Data_Request : UMDiameterPacket
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
	UMDiameterAvpDSR_Flags	*_vardsr_flags;
	UMDiameterAvpSCEF_ID	*_varscef_id;
	NSArray<UMDiameterAvpContext_Identifier *>	*_varcontext_identifier;
	UMDiameterAvpTrace_Reference	*_vartrace_reference;
	NSArray<UMDiameterAvpTS_Code *>	*_varts_code;
	NSArray<UMDiameterAvpSS_Code *>	*_varss_code;
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
@property(readwrite,strong,atomic)	UMDiameterAvpDSR_Flags	*dsr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpContext_Identifier *>	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Reference	*trace_reference;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTS_Code *>	*ts_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSS_Code *>	*ss_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;

@end

