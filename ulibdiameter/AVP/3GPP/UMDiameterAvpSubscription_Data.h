//
//  UMDiameterAvpSubscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
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
	UMDiameterAvpSubscriber_Status	*_var_subscriber_status;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpA_MSISDN	*_var_a_msisdn;
	UMDiameterAvpSTN_SR	*_var_stn_sr;
	UMDiameterAvpICS_Indicator	*_var_ics_indicator;
	UMDiameterAvpNetwork_Access_Mode	*_var_network_access_mode;
	UMDiameterAvpOperator_Determined_Barring	*_var_operator_determined_barring;
	UMDiameterAvpHPLMN_ODB	*_var_hplmn_odb;
	NSArray<UMDiameterAvpRegional_Subscription_Zone_Code *>	*_var_regional_subscription_zone_code;
	UMDiameterAvpAccess_Restriction_Data	*_var_access_restriction_data;
	UMDiameterAvpAPN_OI_Replacement	*_var_apn_oi_replacement;
	UMDiameterAvpLCS_Info	*_var_lcs_info;
	UMDiameterAvpTeleservice_List	*_var_teleservice_list;
	NSArray<UMDiameterAvpCall_Barring_Info *>	*_var_call_barring_info;
	UMDiameterAvp3GPP_Charging_Characteristics	*_var_3gpp_charging_characteristics;
	UMDiameterAvpAMBR	*_var_ambr;
	UMDiameterAvpAPN_Configuration_Profile	*_var_apn_configuration_profile;
	UMDiameterAvpRAT_Frequency_Selection_Priority_ID	*_var_rat_frequency_selection_priority_id;
	UMDiameterAvpTrace_Data	*_var_trace_data;
	UMDiameterAvpGPRS_Subscription_Data	*_var_gprs_subscription_data;
	NSArray<UMDiameterAvpCSG_Subscription_Data *>	*_var_csg_subscription_data;
	UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature	*_var_roaming_restricted_due_to_unsupported_feature;
	UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer	*_var_subscribed_periodic_rau_tau_timer;
	UMDiameterAvpMPS_Priority	*_var_mps_priority;
	UMDiameterAvpVPLMN_LIPA_Allowed	*_var_vplmn_lipa_allowed;
	UMDiameterAvpRelay_Node_Indicator	*_var_relay_node_indicator;
	UMDiameterAvpMDT_User_Consent	*_var_mdt_user_consent;
	UMDiameterAvpSubscribed_VSRVCC	*_var_subscribed_vsrvcc;
	UMDiameterAvpProSe_Subscription_Data	*_var_prose_subscription_data;
	UMDiameterAvpSubscription_Data_Flags	*_var_subscription_data_flags;
	NSArray<UMDiameterAvpAdjacent_Access_Restriction_Data *>	*_var_adjacent_access_restriction_data;
	UMDiameterAvpDL_Buffering_Suggested_Packet_Count	*_var_dl_buffering_suggested_packet_count;
	NSArray<UMDiameterAvpIMSI_Group_Id *>	*_var_imsi_group_id;
	UMDiameterAvpUE_Usage_Type	*_var_ue_usage_type;
	NSArray<UMDiameterAvpAESE_Communication_Pattern *>	*_var_aese_communication_pattern;
	NSArray<UMDiameterAvpMonitoring_Event_Configuration *>	*_var_monitoring_event_configuration;
	UMDiameterAvpEmergency_Info	*_var_emergency_info;
	UMDiameterAvpV2X_Subscription_Data	*_var_v2x_subscription_data;
	NSArray<UMDiameterAvpeDRX_Cycle_Length *>	*_var_edrx_cycle_length;
	UMDiameterAvpExternal_Identifier	*_var_external_identifier;
	UMDiameterAvpActive_Time	*_var_active_time;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSubscriber_Status	*var_subscriber_status;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*var_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpA_MSISDN	*var_a_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpSTN_SR	*var_stn_sr;
@property(readwrite,strong,atomic)	UMDiameterAvpICS_Indicator	*var_ics_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpNetwork_Access_Mode	*var_network_access_mode;
@property(readwrite,strong,atomic)	UMDiameterAvpOperator_Determined_Barring	*var_operator_determined_barring;
@property(readwrite,strong,atomic)	UMDiameterAvpHPLMN_ODB	*var_hplmn_odb;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRegional_Subscription_Zone_Code *>	*var_regional_subscription_zone_code;
@property(readwrite,strong,atomic)	UMDiameterAvpAccess_Restriction_Data	*var_access_restriction_data;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_OI_Replacement	*var_apn_oi_replacement;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Info	*var_lcs_info;
@property(readwrite,strong,atomic)	UMDiameterAvpTeleservice_List	*var_teleservice_list;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCall_Barring_Info *>	*var_call_barring_info;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP_Charging_Characteristics	*var_3gpp_charging_characteristics;
@property(readwrite,strong,atomic)	UMDiameterAvpAMBR	*var_ambr;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_Configuration_Profile	*var_apn_configuration_profile;
@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Frequency_Selection_Priority_ID	*var_rat_frequency_selection_priority_id;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Data	*var_trace_data;
@property(readwrite,strong,atomic)	UMDiameterAvpGPRS_Subscription_Data	*var_gprs_subscription_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCSG_Subscription_Data *>	*var_csg_subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature	*var_roaming_restricted_due_to_unsupported_feature;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer	*var_subscribed_periodic_rau_tau_timer;
@property(readwrite,strong,atomic)	UMDiameterAvpMPS_Priority	*var_mps_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_LIPA_Allowed	*var_vplmn_lipa_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpRelay_Node_Indicator	*var_relay_node_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpMDT_User_Consent	*var_mdt_user_consent;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscribed_VSRVCC	*var_subscribed_vsrvcc;
@property(readwrite,strong,atomic)	UMDiameterAvpProSe_Subscription_Data	*var_prose_subscription_data;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscription_Data_Flags	*var_subscription_data_flags;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAdjacent_Access_Restriction_Data *>	*var_adjacent_access_restriction_data;
@property(readwrite,strong,atomic)	UMDiameterAvpDL_Buffering_Suggested_Packet_Count	*var_dl_buffering_suggested_packet_count;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpIMSI_Group_Id *>	*var_imsi_group_id;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_Usage_Type	*var_ue_usage_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAESE_Communication_Pattern *>	*var_aese_communication_pattern;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMonitoring_Event_Configuration *>	*var_monitoring_event_configuration;
@property(readwrite,strong,atomic)	UMDiameterAvpEmergency_Info	*var_emergency_info;
@property(readwrite,strong,atomic)	UMDiameterAvpV2X_Subscription_Data	*var_v2x_subscription_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpeDRX_Cycle_Length *>	*var_edrx_cycle_length;
@property(readwrite,strong,atomic)	UMDiameterAvpExternal_Identifier	*var_external_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpActive_Time	*var_active_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

