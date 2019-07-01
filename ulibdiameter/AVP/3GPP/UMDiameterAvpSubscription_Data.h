//
//  UMDiameterAvpSubscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSubscriber_Status;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpA_MSISDN;
@class UMDiameterAvpSTN_SR;
@class UMDiameterAvpICS_Indicator;
@class UMDiameterAvpNetwork_Access_Mode;
@class UMDiameterAvpOperator_Determined_Barring;
@class UMDiameterAvpHPLMN_ODB;
@class UMDiameterAvpRegional_Subscription_Zone_Code;
@class UMDiameterAvpAccess_Restriction_Data;
@class UMDiameterAvpAPN_OI_Replacement;
@class UMDiameterAvpLCS_Info;
@class UMDiameterAvpTeleservice_List;
@class UMDiameterAvpCall_Barring_Info;
@class UMDiameterAvp3GPP_Charging_Characteristics;
@class UMDiameterAvpAMBR;
@class UMDiameterAvpAPN_Configuration_Profile;
@class UMDiameterAvpRAT_Frequency_Selection_Priority_ID;
@class UMDiameterAvpTrace_Data;
@class UMDiameterAvpGPRS_Subscription_Data;
@class UMDiameterAvpCSG_Subscription_Data;
@class UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature;
@class UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer;
@class UMDiameterAvpMPS_Priority;
@class UMDiameterAvpVPLMN_LIPA_Allowed;
@class UMDiameterAvpRelay_Node_Indicator;
@class UMDiameterAvpMDT_User_Consent;
@class UMDiameterAvpSubscribed_VSRVCC;
@class UMDiameterAvpProSe_Subscription_Data;
@class UMDiameterAvpSubscription_Data_Flags;
@class UMDiameterAvpAdjacent_Access_Restriction_Data;
@class UMDiameterAvpDL_Buffering_Suggested_Packet_Count;
@class UMDiameterAvpIMSI_Group_Id;
@class UMDiameterAvpUE_Usage_Type;
@class UMDiameterAvpAESE_Communication_Pattern;
@class UMDiameterAvpMonitoring_Event_Configuration;
@class UMDiameterAvpEmergency_Info;
@class UMDiameterAvpV2X_Subscription_Data;
@class UMDiameterAvpeDRX_Cycle_Length;
@class UMDiameterAvpExternal_Identifier;
@class UMDiameterAvpActive_Time;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSubscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpSubscriber_Status	*_subscriber_status;
	UMDiameterAvpMSISDN	*_msisdn;
	UMDiameterAvpA_MSISDN	*_a_msisdn;
	UMDiameterAvpSTN_SR	*_stn_sr;
	UMDiameterAvpICS_Indicator	*_ics_indicator;
	UMDiameterAvpNetwork_Access_Mode	*_network_access_mode;
	UMDiameterAvpOperator_Determined_Barring	*_operator_determined_barring;
	UMDiameterAvpHPLMN_ODB	*_hplmn_odb;
	NSArray<UMDiameterAvpRegional_Subscription_Zone_Code *>	*_regional_subscription_zone_code;
	UMDiameterAvpAccess_Restriction_Data	*_access_restriction_data;
	UMDiameterAvpAPN_OI_Replacement	*_apn_oi_replacement;
	UMDiameterAvpLCS_Info	*_lcs_info;
	UMDiameterAvpTeleservice_List	*_teleservice_list;
	NSArray<UMDiameterAvpCall_Barring_Info *>	*_call_barring_info;
	UMDiameterAvp3GPP_Charging_Characteristics	*_3gpp_charging_characteristics;
	UMDiameterAvpAMBR	*_ambr;
	UMDiameterAvpAPN_Configuration_Profile	*_apn_configuration_profile;
	UMDiameterAvpRAT_Frequency_Selection_Priority_ID	*_rat_frequency_selection_priority_id;
	UMDiameterAvpTrace_Data	*_trace_data;
	UMDiameterAvpGPRS_Subscription_Data	*_gprs_subscription_data;
	NSArray<UMDiameterAvpCSG_Subscription_Data *>	*_csg_subscription_data;
	UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature	*_roaming_restricted_due_to_unsupported_feature;
	UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer	*_subscribed_periodic_rau_tau_timer;
	UMDiameterAvpMPS_Priority	*_mps_priority;
	UMDiameterAvpVPLMN_LIPA_Allowed	*_vplmn_lipa_allowed;
	UMDiameterAvpRelay_Node_Indicator	*_relay_node_indicator;
	UMDiameterAvpMDT_User_Consent	*_mdt_user_consent;
	UMDiameterAvpSubscribed_VSRVCC	*_subscribed_vsrvcc;
	UMDiameterAvpProSe_Subscription_Data	*_prose_subscription_data;
	UMDiameterAvpSubscription_Data_Flags	*_subscription_data_flags;
	NSArray<UMDiameterAvpAdjacent_Access_Restriction_Data *>	*_adjacent_access_restriction_data;
	UMDiameterAvpDL_Buffering_Suggested_Packet_Count	*_dl_buffering_suggested_packet_count;
	NSArray<UMDiameterAvpIMSI_Group_Id *>	*_imsi_group_id;
	UMDiameterAvpUE_Usage_Type	*_ue_usage_type;
	NSArray<UMDiameterAvpAESE_Communication_Pattern *>	*_aese_communication_pattern;
	NSArray<UMDiameterAvpMonitoring_Event_Configuration *>	*_monitoring_event_configuration;
	UMDiameterAvpEmergency_Info	*_emergency_info;
	UMDiameterAvpV2X_Subscription_Data	*_v2x_subscription_data;
	NSArray<UMDiameterAvpeDRX_Cycle_Length *>	*_edrx_cycle_length;
	UMDiameterAvpExternal_Identifier	*_external_identifier;
	UMDiameterAvpActive_Time	*_active_time;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSubscriber_Status	*subscriber_status;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpA_MSISDN	*a_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpSTN_SR	*stn_sr;
@property(readwrite,strong,atomic)	UMDiameterAvpICS_Indicator	*ics_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpNetwork_Access_Mode	*network_access_mode;
@property(readwrite,strong,atomic)	UMDiameterAvpOperator_Determined_Barring	*operator_determined_barring;
@property(readwrite,strong,atomic)	UMDiameterAvpHPLMN_ODB	*hplmn_odb;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRegional_Subscription_Zone_Code *>	*regional_subscription_zone_code;
@property(readwrite,strong,atomic)	UMDiameterAvpAccess_Restriction_Data	*access_restriction_data;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_OI_Replacement	*apn_oi_replacement;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Info	*lcs_info;
@property(readwrite,strong,atomic)	UMDiameterAvpTeleservice_List	*teleservice_list;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCall_Barring_Info *>	*call_barring_info;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP_Charging_Characteristics	*3gpp_charging_characteristics;
@property(readwrite,strong,atomic)	UMDiameterAvpAMBR	*ambr;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_Configuration_Profile	*apn_configuration_profile;
@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Frequency_Selection_Priority_ID	*rat_frequency_selection_priority_id;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Data	*trace_data;
@property(readwrite,strong,atomic)	UMDiameterAvpGPRS_Subscription_Data	*gprs_subscription_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCSG_Subscription_Data *>	*csg_subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature	*roaming_restricted_due_to_unsupported_feature;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer	*subscribed_periodic_rau_tau_timer;
@property(readwrite,strong,atomic)	UMDiameterAvpMPS_Priority	*mps_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_LIPA_Allowed	*vplmn_lipa_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpRelay_Node_Indicator	*relay_node_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpMDT_User_Consent	*mdt_user_consent;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscribed_VSRVCC	*subscribed_vsrvcc;
@property(readwrite,strong,atomic)	UMDiameterAvpProSe_Subscription_Data	*prose_subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscription_Data_Flags	*subscription_data_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAdjacent_Access_Restriction_Data *>	*adjacent_access_restriction_data;
@property(readwrite,strong,atomic)	UMDiameterAvpDL_Buffering_Suggested_Packet_Count	*dl_buffering_suggested_packet_count;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpIMSI_Group_Id *>	*imsi_group_id;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_Usage_Type	*ue_usage_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAESE_Communication_Pattern *>	*aese_communication_pattern;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Configuration *>	*monitoring_event_configuration;
@property(readwrite,strong,atomic)	UMDiameterAvpEmergency_Info	*emergency_info;
@property(readwrite,strong,atomic)	UMDiameterAvpV2X_Subscription_Data	*v2x_subscription_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpeDRX_Cycle_Length *>	*edrx_cycle_length;
@property(readwrite,strong,atomic)	UMDiameterAvpExternal_Identifier	*external_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpActive_Time	*active_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

