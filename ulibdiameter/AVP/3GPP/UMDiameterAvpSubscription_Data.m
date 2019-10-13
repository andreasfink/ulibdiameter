//
//  UMDiameterAvpSubscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
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
        [arr addObject:_var_subscriber_status];
    }
    if(_var_msisdn)
    {
        [arr addObject:_var_msisdn];
    }
    if(_var_a_msisdn)
    {
        [arr addObject:_var_a_msisdn];
    }
    if(_var_stn_sr)
    {
        [arr addObject:_var_stn_sr];
    }
    if(_var_ics_indicator)
    {
        [arr addObject:_var_ics_indicator];
    }
    if(_var_network_access_mode)
    {
        [arr addObject:_var_network_access_mode];
    }
    if(_var_operator_determined_barring)
    {
        [arr addObject:_var_operator_determined_barring];
    }
    if(_var_hplmn_odb)
    {
        [arr addObject:_var_hplmn_odb];
    }
    if(_var_regional_subscription_zone_code.count > 0)
    {
        for(UMDiameterAvpRegional_Subscription_Zone_Code *o in _var_regional_subscription_zone_code)
        {
            [arr addObject:o];
        }
    }
    if(_var_access_restriction_data)
    {
        [arr addObject:_var_access_restriction_data];
    }
    if(_var_apn_oi_replacement)
    {
        [arr addObject:_var_apn_oi_replacement];
    }
    if(_var_lcs_info)
    {
        [arr addObject:_var_lcs_info];
    }
    if(_var_teleservice_list)
    {
        [arr addObject:_var_teleservice_list];
    }
    if(_var_call_barring_info.count > 0)
    {
        for(UMDiameterAvpCall_Barring_Info *o in _var_call_barring_info)
        {
            [arr addObject:o];
        }
    }
    if(_var_3gpp_charging_characteristics)
    {
        [arr addObject:_var_3gpp_charging_characteristics];
    }
    if(_var_ambr)
    {
        [arr addObject:_var_ambr];
    }
    if(_var_apn_configuration_profile)
    {
        [arr addObject:_var_apn_configuration_profile];
    }
    if(_var_rat_frequency_selection_priority_id)
    {
        [arr addObject:_var_rat_frequency_selection_priority_id];
    }
    if(_var_trace_data)
    {
        [arr addObject:_var_trace_data];
    }
    if(_var_gprs_subscription_data)
    {
        [arr addObject:_var_gprs_subscription_data];
    }
    if(_var_csg_subscription_data.count > 0)
    {
        for(UMDiameterAvpCSG_Subscription_Data *o in _var_csg_subscription_data)
        {
            [arr addObject:o];
        }
    }
    if(_var_roaming_restricted_due_to_unsupported_feature)
    {
        [arr addObject:_var_roaming_restricted_due_to_unsupported_feature];
    }
    if(_var_subscribed_periodic_rau_tau_timer)
    {
        [arr addObject:_var_subscribed_periodic_rau_tau_timer];
    }
    if(_var_mps_priority)
    {
        [arr addObject:_var_mps_priority];
    }
    if(_var_vplmn_lipa_allowed)
    {
        [arr addObject:_var_vplmn_lipa_allowed];
    }
    if(_var_relay_node_indicator)
    {
        [arr addObject:_var_relay_node_indicator];
    }
    if(_var_mdt_user_consent)
    {
        [arr addObject:_var_mdt_user_consent];
    }
    if(_var_subscribed_vsrvcc)
    {
        [arr addObject:_var_subscribed_vsrvcc];
    }
    if(_var_prose_subscription_data)
    {
        [arr addObject:_var_prose_subscription_data];
    }
    if(_var_subscription_data_flags)
    {
        [arr addObject:_var_subscription_data_flags];
    }
    if(_var_adjacent_access_restriction_data.count > 0)
    {
        for(UMDiameterAvpAdjacent_Access_Restriction_Data *o in _var_adjacent_access_restriction_data)
        {
            [arr addObject:o];
        }
    }
    if(_var_dl_buffering_suggested_packet_count)
    {
        [arr addObject:_var_dl_buffering_suggested_packet_count];
    }
    if(_var_imsi_group_id.count > 0)
    {
        for(UMDiameterAvpIMSI_Group_Id *o in _var_imsi_group_id)
        {
            [arr addObject:o];
        }
    }
    if(_var_ue_usage_type)
    {
        [arr addObject:_var_ue_usage_type];
    }
    if(_var_aese_communication_pattern.count > 0)
    {
        for(UMDiameterAvpAESE_Communication_Pattern *o in _var_aese_communication_pattern)
        {
            [arr addObject:o];
        }
    }
    if(_var_monitoring_event_configuration.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Configuration *o in _var_monitoring_event_configuration)
        {
            [arr addObject:o];
        }
    }
    if(_var_emergency_info)
    {
        [arr addObject:_var_emergency_info];
    }
    if(_var_v2x_subscription_data)
    {
        [arr addObject:_var_v2x_subscription_data];
    }
    if(_var_edrx_cycle_length.count > 0)
    {
        for(UMDiameterAvpeDRX_Cycle_Length *o in _var_edrx_cycle_length)
        {
            [arr addObject:o];
        }
    }
    if(_var_external_identifier)
    {
        [arr addObject:_var_external_identifier];
    }
    if(_var_active_time)
    {
        [arr addObject:_var_active_time];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
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

@end

