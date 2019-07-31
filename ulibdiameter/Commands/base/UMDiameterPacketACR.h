//
//  UMDiameterPacketACR.h
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:37:43.985000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_Id;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpAccounting_Record_Type;
@class UMDiameterAvpAccounting_Record_Number;
@class UMDiameterAvpAcct_Application_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpAccounting_Sub_Session_Id;
@class UMDiameterAvpAcct_Session_Id;
@class UMDiameterAvpAcct_Multi_Session_Id;
@class UMDiameterAvpAcct_Interim_Interval;
@class UMDiameterAvpAccounting_Realtime_Required;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpEvent_Timestamp;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketACR : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpAccounting_Record_Type	*_var_accounting_record_type;
	UMDiameterAvpAccounting_Record_Number	*_var_accounting_record_number;
	UMDiameterAvpAcct_Application_Id	*_var_acct_application_id;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpAccounting_Sub_Session_Id	*_var_accounting_sub_session_id;
	UMDiameterAvpAcct_Session_Id	*_var_acct_session_id;
	UMDiameterAvpAcct_Multi_Session_Id	*_var_acct_multi_session_id;
	UMDiameterAvpAcct_Interim_Interval	*_var_acct_interim_interval;
	UMDiameterAvpAccounting_Realtime_Required	*_var_accounting_realtime_required;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	UMDiameterAvpEvent_Timestamp	*_var_event_timestamp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpAccounting_Record_Type	*accounting_record_type;
@property(readwrite,strong,atomic)	UMDiameterAvpAccounting_Record_Number	*accounting_record_number;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Application_Id	*acct_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpAccounting_Sub_Session_Id	*accounting_sub_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Session_Id	*acct_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Multi_Session_Id	*acct_multi_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Interim_Interval	*acct_interim_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpAccounting_Realtime_Required	*accounting_realtime_required;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Timestamp	*event_timestamp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*route_record;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

