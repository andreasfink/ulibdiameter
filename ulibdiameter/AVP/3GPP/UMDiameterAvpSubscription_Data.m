//
//  UMDiameterAvpSubscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data.h"
#import "UMDiameterAvpSubscriber_Status.h"
#import "UMDiameterAvpMSISDN.h"
#import "UMDiameterAvpA_MSISDN.h"
#import "UMDiameterAvpSTN_SR.h"
#import "UMDiameterAvpICS_Indicator.h"
#import "UMDiameterAvpNetwork_Access_Mode.h"
#import "UMDiameterAvpOperator_Determined_Barring.h"
#import "UMDiameterAvpHPLMN_ODB.h"
#import "UMDiameterAvpRegional_Subscription_Zone_Code.h"
#import "UMDiameterAvpAccess_Restriction_Data.h"
#import "UMDiameterAvpAPN_OI_Replacement.h"
#import "UMDiameterAvpLCS_Info.h"
#import "UMDiameterAvpTeleservice_List.h"
#import "UMDiameterAvpCall_Barring_Info.h"
#import "UMDiameterAvp3GPP_Charging_Characteristics.h"
#import "UMDiameterAvpAMBR.h"
#import "UMDiameterAvpAPN_Configuration_Profile.h"
#import "UMDiameterAvpRAT_Frequency_Selection_Priority_ID.h"
#import "UMDiameterAvpTrace_Data.h"
#import "UMDiameterAvpGPRS_Subscription_Data.h"
#import "UMDiameterAvpCSG_Subscription_Data.h"
#import "UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature.h"
#import "UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.h"
#import "UMDiameterAvpMPS_Priority.h"
#import "UMDiameterAvpVPLMN_LIPA_Allowed.h"
#import "UMDiameterAvpRelay_Node_Indicator.h"
#import "UMDiameterAvpMDT_User_Consent.h"
#import "UMDiameterAvpSubscribed_VSRVCC.h"
#import "UMDiameterAvpProSe_Subscription_Data.h"
#import "UMDiameterAvpSubscription_Data_Flags.h"
#import "UMDiameterAvpAdjacent_Access_Restriction_Data.h"
#import "UMDiameterAvpDL_Buffering_Suggested_Packet_Count.h"
#import "UMDiameterAvpIMSI_Group_Id.h"
#import "UMDiameterAvpUE_Usage_Type.h"
#import "UMDiameterAvpAESE_Communication_Pattern.h"
#import "UMDiameterAvpMonitoring_Event_Configuration.h"
#import "UMDiameterAvpEmergency_Info.h"
#import "UMDiameterAvpV2X_Subscription_Data.h"
#import "UMDiameterAvpeDRX_Cycle_Length.h"
#import "UMDiameterAvpExternal_Identifier.h"
#import "UMDiameterAvpActive_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSubscription_Data


- (NSString *)avpType
{
    return @"Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1400;
}

+ (uint32_t)avpCode
{
    return 1400;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_subscriber_status)
    {
        [_var_subscriber_status beforeEncode];
        [arr addObject:_var_subscriber_status];
    }
    if(_var_msisdn)
    {
        [_var_msisdn beforeEncode];
        [arr addObject:_var_msisdn];
    }
    if(_var_a_msisdn)
    {
        [_var_a_msisdn beforeEncode];
        [arr addObject:_var_a_msisdn];
    }
    if(_var_stn_sr)
    {
        [_var_stn_sr beforeEncode];
        [arr addObject:_var_stn_sr];
    }
    if(_var_ics_indicator)
    {
        [_var_ics_indicator beforeEncode];
        [arr addObject:_var_ics_indicator];
    }
    if(_var_network_access_mode)
    {
        [_var_network_access_mode beforeEncode];
        [arr addObject:_var_network_access_mode];
    }
    if(_var_operator_determined_barring)
    {
        [_var_operator_determined_barring beforeEncode];
        [arr addObject:_var_operator_determined_barring];
    }
    if(_var_hplmn_odb)
    {
        [_var_hplmn_odb beforeEncode];
        [arr addObject:_var_hplmn_odb];
    }
    if(_var_regional_subscription_zone_code.count > 0)
    {
        for(UMDiameterAvpRegional_Subscription_Zone_Code *o in _var_regional_subscription_zone_code)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_access_restriction_data)
    {
        [_var_access_restriction_data beforeEncode];
        [arr addObject:_var_access_restriction_data];
    }
    if(_var_apn_oi_replacement)
    {
        [_var_apn_oi_replacement beforeEncode];
        [arr addObject:_var_apn_oi_replacement];
    }
    if(_var_lcs_info)
    {
        [_var_lcs_info beforeEncode];
        [arr addObject:_var_lcs_info];
    }
    if(_var_teleservice_list)
    {
        [_var_teleservice_list beforeEncode];
        [arr addObject:_var_teleservice_list];
    }
    if(_var_call_barring_info.count > 0)
    {
        for(UMDiameterAvpCall_Barring_Info *o in _var_call_barring_info)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_3gpp_charging_characteristics)
    {
        [_var_3gpp_charging_characteristics beforeEncode];
        [arr addObject:_var_3gpp_charging_characteristics];
    }
    if(_var_ambr)
    {
        [_var_ambr beforeEncode];
        [arr addObject:_var_ambr];
    }
    if(_var_apn_configuration_profile)
    {
        [_var_apn_configuration_profile beforeEncode];
        [arr addObject:_var_apn_configuration_profile];
    }
    if(_var_rat_frequency_selection_priority_id)
    {
        [_var_rat_frequency_selection_priority_id beforeEncode];
        [arr addObject:_var_rat_frequency_selection_priority_id];
    }
    if(_var_trace_data)
    {
        [_var_trace_data beforeEncode];
        [arr addObject:_var_trace_data];
    }
    if(_var_gprs_subscription_data)
    {
        [_var_gprs_subscription_data beforeEncode];
        [arr addObject:_var_gprs_subscription_data];
    }
    if(_var_csg_subscription_data.count > 0)
    {
        for(UMDiameterAvpCSG_Subscription_Data *o in _var_csg_subscription_data)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_roaming_restricted_due_to_unsupported_feature)
    {
        [_var_roaming_restricted_due_to_unsupported_feature beforeEncode];
        [arr addObject:_var_roaming_restricted_due_to_unsupported_feature];
    }
    if(_var_subscribed_periodic_rau_tau_timer)
    {
        [_var_subscribed_periodic_rau_tau_timer beforeEncode];
        [arr addObject:_var_subscribed_periodic_rau_tau_timer];
    }
    if(_var_mps_priority)
    {
        [_var_mps_priority beforeEncode];
        [arr addObject:_var_mps_priority];
    }
    if(_var_vplmn_lipa_allowed)
    {
        [_var_vplmn_lipa_allowed beforeEncode];
        [arr addObject:_var_vplmn_lipa_allowed];
    }
    if(_var_relay_node_indicator)
    {
        [_var_relay_node_indicator beforeEncode];
        [arr addObject:_var_relay_node_indicator];
    }
    if(_var_mdt_user_consent)
    {
        [_var_mdt_user_consent beforeEncode];
        [arr addObject:_var_mdt_user_consent];
    }
    if(_var_subscribed_vsrvcc)
    {
        [_var_subscribed_vsrvcc beforeEncode];
        [arr addObject:_var_subscribed_vsrvcc];
    }
    if(_var_prose_subscription_data)
    {
        [_var_prose_subscription_data beforeEncode];
        [arr addObject:_var_prose_subscription_data];
    }
    if(_var_subscription_data_flags)
    {
        [_var_subscription_data_flags beforeEncode];
        [arr addObject:_var_subscription_data_flags];
    }
    if(_var_adjacent_access_restriction_data.count > 0)
    {
        for(UMDiameterAvpAdjacent_Access_Restriction_Data *o in _var_adjacent_access_restriction_data)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_dl_buffering_suggested_packet_count)
    {
        [_var_dl_buffering_suggested_packet_count beforeEncode];
        [arr addObject:_var_dl_buffering_suggested_packet_count];
    }
    if(_var_imsi_group_id.count > 0)
    {
        for(UMDiameterAvpIMSI_Group_Id *o in _var_imsi_group_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_ue_usage_type)
    {
        [_var_ue_usage_type beforeEncode];
        [arr addObject:_var_ue_usage_type];
    }
    if(_var_aese_communication_pattern.count > 0)
    {
        for(UMDiameterAvpAESE_Communication_Pattern *o in _var_aese_communication_pattern)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_monitoring_event_configuration.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Configuration *o in _var_monitoring_event_configuration)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_emergency_info)
    {
        [_var_emergency_info beforeEncode];
        [arr addObject:_var_emergency_info];
    }
    if(_var_v2x_subscription_data)
    {
        [_var_v2x_subscription_data beforeEncode];
        [arr addObject:_var_v2x_subscription_data];
    }
    if(_var_edrx_cycle_length.count > 0)
    {
        for(UMDiameterAvpeDRX_Cycle_Length *o in _var_edrx_cycle_length)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_external_identifier)
    {
        [_var_external_identifier beforeEncode];
        [arr addObject:_var_external_identifier];
    }
    if(_var_active_time)
    {
        [_var_active_time beforeEncode];
        [arr addObject:_var_active_time];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscriber-status]",webName];
        [UMDiameterAvpSubscriber_Status appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[msisdn]",webName];
        [UMDiameterAvpMSISDN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[a-msisdn]",webName];
        [UMDiameterAvpA_MSISDN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[stn-sr]",webName];
        [UMDiameterAvpSTN_SR appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ics-indicator]",webName];
        [UMDiameterAvpICS_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[network-access-mode]",webName];
        [UMDiameterAvpNetwork_Access_Mode appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[operator-determined-barring]",webName];
        [UMDiameterAvpOperator_Determined_Barring appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[hplmn-odb]",webName];
        [UMDiameterAvpHPLMN_ODB appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[regional-subscription-zone-code][]",webName];
        [UMDiameterAvpRegional_Subscription_Zone_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[access-restriction-data]",webName];
        [UMDiameterAvpAccess_Restriction_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[apn-oi-replacement]",webName];
        [UMDiameterAvpAPN_OI_Replacement appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-info]",webName];
        [UMDiameterAvpLCS_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[teleservice-list]",webName];
        [UMDiameterAvpTeleservice_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[call-barring-info][]",webName];
        [UMDiameterAvpCall_Barring_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[3gpp-charging-characteristics]",webName];
        [UMDiameterAvp3GPP_Charging_Characteristics appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ambr]",webName];
        [UMDiameterAvpAMBR appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[apn-configuration-profile]",webName];
        [UMDiameterAvpAPN_Configuration_Profile appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[rat-frequency-selection-priority-id]",webName];
        [UMDiameterAvpRAT_Frequency_Selection_Priority_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[trace-data]",webName];
        [UMDiameterAvpTrace_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[gprs-subscription-data]",webName];
        [UMDiameterAvpGPRS_Subscription_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[csg-subscription-data][]",webName];
        [UMDiameterAvpCSG_Subscription_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[roaming-restricted-due-to-unsupported-feature]",webName];
        [UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscribed-periodic-rau-tau-timer]",webName];
        [UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mps-priority]",webName];
        [UMDiameterAvpMPS_Priority appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vplmn-lipa-allowed]",webName];
        [UMDiameterAvpVPLMN_LIPA_Allowed appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[relay-node-indicator]",webName];
        [UMDiameterAvpRelay_Node_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mdt-user-consent]",webName];
        [UMDiameterAvpMDT_User_Consent appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscribed-vsrvcc]",webName];
        [UMDiameterAvpSubscribed_VSRVCC appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[prose-subscription-data]",webName];
        [UMDiameterAvpProSe_Subscription_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscription-data-flags]",webName];
        [UMDiameterAvpSubscription_Data_Flags appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[adjacent-access-restriction-data][]",webName];
        [UMDiameterAvpAdjacent_Access_Restriction_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[dl-buffering-suggested-packet-count]",webName];
        [UMDiameterAvpDL_Buffering_Suggested_Packet_Count appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[imsi-group-id][]",webName];
        [UMDiameterAvpIMSI_Group_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ue-usage-type]",webName];
        [UMDiameterAvpUE_Usage_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[aese-communication-pattern][]",webName];
        [UMDiameterAvpAESE_Communication_Pattern appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[monitoring-event-configuration][]",webName];
        [UMDiameterAvpMonitoring_Event_Configuration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[emergency-info]",webName];
        [UMDiameterAvpEmergency_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[v2x-subscription-data]",webName];
        [UMDiameterAvpV2X_Subscription_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[edrx-cycle-length][]",webName];
        [UMDiameterAvpeDRX_Cycle_Length appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[external-identifier]",webName];
        [UMDiameterAvpExternal_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[active-time]",webName];
        [UMDiameterAvpActive_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Subscriber-Status"] = [_var_subscriber_status objectValue];
	dict[@"MSISDN"] = [_var_msisdn objectValue];
	dict[@"A-MSISDN"] = [_var_a_msisdn objectValue];
	dict[@"STN-SR"] = [_var_stn_sr objectValue];
	dict[@"ICS-Indicator"] = [_var_ics_indicator objectValue];
	dict[@"Network-Access-Mode"] = [_var_network_access_mode objectValue];
	dict[@"Operator-Determined-Barring"] = [_var_operator_determined_barring objectValue];
	dict[@"HPLMN-ODB"] = [_var_hplmn_odb objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_regional_subscription_zone_code.count>0)
		{
			for(UMDiameterAvp *avp in _var_regional_subscription_zone_code)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Regional-Subscription-Zone-Code"] = arr;
		}
	}
	dict[@"Access-Restriction-Data"] = [_var_access_restriction_data objectValue];
	dict[@"APN-OI-Replacement"] = [_var_apn_oi_replacement objectValue];
	dict[@"LCS-Info"] = [_var_lcs_info objectValue];
	dict[@"Teleservice-List"] = [_var_teleservice_list objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_call_barring_info.count>0)
		{
			for(UMDiameterAvp *avp in _var_call_barring_info)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Call-Barring-Info"] = arr;
		}
	}
	dict[@"3GPP-Charging-Characteristics"] = [_var_3gpp_charging_characteristics objectValue];
	dict[@"AMBR"] = [_var_ambr objectValue];
	dict[@"APN-Configuration-Profile"] = [_var_apn_configuration_profile objectValue];
	dict[@"RAT-Frequency-Selection-Priority-ID"] = [_var_rat_frequency_selection_priority_id objectValue];
	dict[@"Trace-Data"] = [_var_trace_data objectValue];
	dict[@"GPRS-Subscription-Data"] = [_var_gprs_subscription_data objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_csg_subscription_data.count>0)
		{
			for(UMDiameterAvp *avp in _var_csg_subscription_data)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"CSG-Subscription-Data"] = arr;
		}
	}
	dict[@"Roaming-Restricted-Due-To-Unsupported-Feature"] = [_var_roaming_restricted_due_to_unsupported_feature objectValue];
	dict[@"Subscribed-Periodic-RAU-TAU-Timer"] = [_var_subscribed_periodic_rau_tau_timer objectValue];
	dict[@"MPS-Priority"] = [_var_mps_priority objectValue];
	dict[@"VPLMN-LIPA-Allowed"] = [_var_vplmn_lipa_allowed objectValue];
	dict[@"Relay-Node-Indicator"] = [_var_relay_node_indicator objectValue];
	dict[@"MDT-User-Consent"] = [_var_mdt_user_consent objectValue];
	dict[@"Subscribed-VSRVCC"] = [_var_subscribed_vsrvcc objectValue];
	dict[@"ProSe-Subscription-Data"] = [_var_prose_subscription_data objectValue];
	dict[@"Subscription-Data-Flags"] = [_var_subscription_data_flags objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_adjacent_access_restriction_data.count>0)
		{
			for(UMDiameterAvp *avp in _var_adjacent_access_restriction_data)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Adjacent-Access-Restriction-Data"] = arr;
		}
	}
	dict[@"DL-Buffering-Suggested-Packet-Count"] = [_var_dl_buffering_suggested_packet_count objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_imsi_group_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_imsi_group_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"IMSI-Group-Id"] = arr;
		}
	}
	dict[@"UE-Usage-Type"] = [_var_ue_usage_type objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_aese_communication_pattern.count>0)
		{
			for(UMDiameterAvp *avp in _var_aese_communication_pattern)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"AESE-Communication-Pattern"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_monitoring_event_configuration.count>0)
		{
			for(UMDiameterAvp *avp in _var_monitoring_event_configuration)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Monitoring-Event-Configuration"] = arr;
		}
	}
	dict[@"Emergency-Info"] = [_var_emergency_info objectValue];
	dict[@"V2X-Subscription-Data"] = [_var_v2x_subscription_data objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_edrx_cycle_length.count>0)
		{
			for(UMDiameterAvp *avp in _var_edrx_cycle_length)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"eDRX-Cycle-Length"] = arr;
		}
	}
	dict[@"External-Identifier"] = [_var_external_identifier objectValue];
	dict[@"Active-Time"] = [_var_active_time objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"subscription-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubscriber_Status definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMSISDN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpA_MSISDN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSTN_SR definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpICS_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpNetwork_Access_Mode definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOperator_Determined_Barring definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpHPLMN_ODB definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRegional_Subscription_Zone_Code definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        def[@"maximum-count"]=@(10);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccess_Restriction_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAPN_OI_Replacement definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLCS_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTeleservice_List definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCall_Barring_Info definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvp3GPP_Charging_Characteristics definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAMBR definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAPN_Configuration_Profile definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRAT_Frequency_Selection_Priority_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTrace_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGPRS_Subscription_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCSG_Subscription_Data definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMPS_Priority definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVPLMN_LIPA_Allowed definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRelay_Node_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMDT_User_Consent definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubscribed_VSRVCC definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProSe_Subscription_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubscription_Data_Flags definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAdjacent_Access_Restriction_Data definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDL_Buffering_Suggested_Packet_Count definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIMSI_Group_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUE_Usage_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAESE_Communication_Pattern definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Event_Configuration definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEmergency_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpV2X_Subscription_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpeDRX_Cycle_Length definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExternal_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpActive_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

