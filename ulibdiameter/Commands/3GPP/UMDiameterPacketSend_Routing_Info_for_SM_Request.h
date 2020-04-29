//
//  UMDiameterPacketSend_Routing_Info_for_SM_Request.h
//  ulibdiameter
//
//  Created by afink on 2020-04-29 20:17:05.674257
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
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpSMSMI_Correlation_ID;
@class UMDiameterAvpSupported_Features;
@class UMDiameterAvpSC_Address;
@class UMDiameterAvpSM_RP_MTI;
@class UMDiameterAvpSM_RP_SMEA;
@class UMDiameterAvpSRR_Flags;
@class UMDiameterAvpSM_Delivery_Not_Intended;
@class UMDiameterAvpAVP;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@interface UMDiameterPacketSend_Routing_Info_for_SM_Request : UMDiameterPacket
{
	UMDiameterAvpSession_Id	*_var_session_id;
	UMDiameterAvpDRMP	*_var_drmp;
	UMDiameterAvpVendor_Specific_Application_Id	*_var_vendor_specific_application_id;
	UMDiameterAvpAuth_Session_State	*_var_auth_session_state;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpSMSMI_Correlation_ID	*_var_smsmi_correlation_id;
	NSArray<UMDiameterAvpSupported_Features *>	*_var_supported_features;
	UMDiameterAvpSC_Address	*_var_sc_address;
	UMDiameterAvpSM_RP_MTI	*_var_sm_rp_mti;
	UMDiameterAvpSM_RP_SMEA	*_var_sm_rp_smea;
	UMDiameterAvpSRR_Flags	*_var_srr_flags;
	UMDiameterAvpSM_Delivery_Not_Intended	*_var_sm_delivery_not_intended;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
	NSArray<UMDiameterAvpProxy_Info *>	*_var_proxy_info;
	NSArray<UMDiameterAvpRoute_Record *>	*_var_route_record;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSession_Id	*var_session_id;
@property(readwrite,strong,atomic)	UMDiameterAvpDRMP	*var_drmp;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Specific_Application_Id	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Session_State	*var_auth_session_state;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*var_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpSMSMI_Correlation_ID	*var_smsmi_correlation_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Features *>	*var_supported_features;
@property(readwrite,strong,atomic)	UMDiameterAvpSC_Address	*var_sc_address;
@property(readwrite,strong,atomic)	UMDiameterAvpSM_RP_MTI	*var_sm_rp_mti;
@property(readwrite,strong,atomic)	UMDiameterAvpSM_RP_SMEA	*var_sm_rp_smea;
@property(readwrite,strong,atomic)	UMDiameterAvpSRR_Flags	*var_srr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpSM_Delivery_Not_Intended	*var_sm_delivery_not_intended;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProxy_Info *>	*var_proxy_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRoute_Record *>	*var_route_record;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

