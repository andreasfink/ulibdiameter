//
//  UMDiameterAvpSubscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data.h"

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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSubscriber_Status  avpCode])
        {
            avp = [[UMDiameterAvpSubscriber_Status alloc]initWithAvp:avp];
            _var_subscriber_status = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMSISDN avpCode])
        {
            avp = [[UMDiameterAvpMSISDN alloc]initWithAvp:avp];
            _var_msisdn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpA_MSISDN avpCode])
        {
            avp = [[UMDiameterAvpA_MSISDN alloc]initWithAvp:avp];
            _var_a_msisdn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSTN_SR avpCode])
        {
            avp = [[UMDiameterAvpSTN_SR alloc]initWithAvp:avp];
            _var_stn_sr = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpICS_Indicator avpCode])
        {
            avp = [[UMDiameterAvpICS_Indicator alloc]initWithAvp:avp];
            _var_ics_indicator = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNetwork_Access_Mode avpCode])
        {
            avp = [[UMDiameterAvpNetwork_Access_Mode alloc]initWithAvp:avp];
            _var_network_access_mode = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpOperator_Determined_Barring avpCode])
        {
            avp = [[UMDiameterAvpOperator_Determined_Barring alloc]initWithAvp:avp];
            _var_operator_determined_barring = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpHPLMN_ODB avpCode])
        {
            avp = [[UMDiameterAvpHPLMN_ODB alloc]initWithAvp:avp];
            _var_hplmn_odb = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRegional_Subscription_Zone_Code avpCode])
        {
            avp = [[UMDiameterAvpRegional_Subscription_Zone_Code alloc]initWithAvp:avp];
            _var_regional_subscription_zone_code = avp;
            [knownAVPs addObject:avp];
            if(_var_regional_subscription_zone_code == NULL)
            {
                _var_regional_subscription_zone_code = @[avp];
            }
            else
            {
                _var_regional_subscription_zone_code = [_var_regional_subscription_zone_code arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAccess_Restriction_Data avpCode])
        {
            avp = [[UMDiameterAvpAccess_Restriction_Data alloc]initWithAvp:avp];
            _var_access_restriction_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_OI_Replacement avpCode])
        {
            avp = [[UMDiameterAvpAPN_OI_Replacement alloc]initWithAvp:avp];
            _var_apn_oi_replacement = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_Info avpCode])
        {
            avp = [[UMDiameterAvpLCS_Info alloc]initWithAvp:avp];
            _var_lcs_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTeleservice_List avpCode])
        {
            avp = [[UMDiameterAvpTeleservice_List alloc]initWithAvp:avp];
            _var_teleservice_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCall_Barring_Info avpCode])
        {
            avp = [[UMDiameterAvpCall_Barring_Info alloc]initWithAvp:avp];
            _var_call_barring_info = avp;
            [knownAVPs addObject:avp];
            if(_var_call_barring_info == NULL)
            {
                _var_call_barring_info = @[avp];
            }
            else
            {
                _var_call_barring_info = [_var_call_barring_info arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_Charging_Characteristics avpCode])
        {
            avp = [[UMDiameterAvp3GPP_Charging_Characteristics alloc]initWithAvp:avp];
            _var_3gpp_charging_characteristics = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAMBR avpCode])
        {
            avp = [[UMDiameterAvpAMBR alloc]initWithAvp:avp];
            _var_ambr = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_Configuration_Profile avpCode])
        {
            avp = [[UMDiameterAvpAPN_Configuration_Profile alloc]initWithAvp:avp];
            _var_apn_configuration_profile = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRAT_Frequency_Selection_Priority_ID avpCode])
        {
            avp = [[UMDiameterAvpRAT_Frequency_Selection_Priority_ID alloc]initWithAvp:avp];
            _var_rat_frequency_selection_priority_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Data avpCode])
        {
            avp = [[UMDiameterAvpTrace_Data alloc]initWithAvp:avp];
            _var_trace_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGPRS_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpGPRS_Subscription_Data alloc]initWithAvp:avp];
            _var_gprs_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCSG_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpCSG_Subscription_Data alloc]initWithAvp:avp];
            _var_csg_subscription_data = avp;
            [knownAVPs addObject:avp];
            if(_var_csg_subscription_data == NULL)
            {
                _var_csg_subscription_data = @[avp];
            }
            else
            {
                _var_csg_subscription_data = [_var_csg_subscription_data arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature avpCode])
        {
            avp = [[UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature alloc]initWithAvp:avp];
            _var_roaming_restricted_due_to_unsupported_feature = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer avpCode])
        {
            avp = [[UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer alloc]initWithAvp:avp];
            _var_subscribed_periodic_rau_tau_timer = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMPS_Priority avpCode])
        {
            avp = [[UMDiameterAvpMPS_Priority alloc]initWithAvp:avp];
            _var_mps_priority = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_LIPA_Allowed avpCode])
        {
            avp = [[UMDiameterAvpVPLMN_LIPA_Allowed alloc]initWithAvp:avp];
            _var_vplmn_lipa_allowed = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRelay_Node_Indicator avpCode])
        {
            avp = [[UMDiameterAvpRelay_Node_Indicator alloc]initWithAvp:avp];
            _var_relay_node_indicator = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_User_Consent avpCode])
        {
            avp = [[UMDiameterAvpMDT_User_Consent alloc]initWithAvp:avp];
            _var_mdt_user_consent = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_VSRVCC avpCode])
        {
            avp = [[UMDiameterAvpSubscribed_VSRVCC alloc]initWithAvp:avp];
            _var_subscribed_vsrvcc = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpProSe_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpProSe_Subscription_Data alloc]initWithAvp:avp];
            _var_prose_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Data_Flags avpCode])
        {
            avp = [[UMDiameterAvpSubscription_Data_Flags alloc]initWithAvp:avp];
            _var_subscription_data_flags = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAdjacent_Access_Restriction_Data avpCode])
        {
            avp = [[UMDiameterAvpAdjacent_Access_Restriction_Data alloc]initWithAvp:avp];
            _var_adjacent_access_restriction_data = avp;
            [knownAVPs addObject:avp];
            if(_var_adjacent_access_restriction_data == NULL)
            {
                _var_adjacent_access_restriction_data = @[avp];
            }
            else
            {
                _var_adjacent_access_restriction_data = [_var_adjacent_access_restriction_data arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpDL_Buffering_Suggested_Packet_Count avpCode])
        {
            avp = [[UMDiameterAvpDL_Buffering_Suggested_Packet_Count alloc]initWithAvp:avp];
            _var_dl_buffering_suggested_packet_count = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpIMSI_Group_Id avpCode])
        {
            avp = [[UMDiameterAvpIMSI_Group_Id alloc]initWithAvp:avp];
            _var_imsi_group_id = avp;
            [knownAVPs addObject:avp];
            if(_var_imsi_group_id == NULL)
            {
                _var_imsi_group_id = @[avp];
            }
            else
            {
                _var_imsi_group_id = [_var_imsi_group_id arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUE_Usage_Type avpCode])
        {
            avp = [[UMDiameterAvpUE_Usage_Type alloc]initWithAvp:avp];
            _var_ue_usage_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAESE_Communication_Pattern avpCode])
        {
            avp = [[UMDiameterAvpAESE_Communication_Pattern alloc]initWithAvp:avp];
            _var_aese_communication_pattern = avp;
            [knownAVPs addObject:avp];
            if(_var_aese_communication_pattern == NULL)
            {
                _var_aese_communication_pattern = @[avp];
            }
            else
            {
                _var_aese_communication_pattern = [_var_aese_communication_pattern arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Event_Configuration avpCode])
        {
            avp = [[UMDiameterAvpMonitoring_Event_Configuration alloc]initWithAvp:avp];
            _var_monitoring_event_configuration = avp;
            [knownAVPs addObject:avp];
            if(_var_monitoring_event_configuration == NULL)
            {
                _var_monitoring_event_configuration = @[avp];
            }
            else
            {
                _var_monitoring_event_configuration = [_var_monitoring_event_configuration arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpEmergency_Info avpCode])
        {
            avp = [[UMDiameterAvpEmergency_Info alloc]initWithAvp:avp];
            _var_emergency_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpV2X_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpV2X_Subscription_Data alloc]initWithAvp:avp];
            _var_v2x_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpeDRX_Cycle_Length avpCode])
        {
            avp = [[UMDiameterAvpeDRX_Cycle_Length alloc]initWithAvp:avp];
            _var_edrx_cycle_length = avp;
            [knownAVPs addObject:avp];
            if(_var_edrx_cycle_length == NULL)
            {
                _var_edrx_cycle_length = @[avp];
            }
            else
            {
                _var_edrx_cycle_length = [_var_edrx_cycle_length arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Identifier avpCode])
        {
            avp = [[UMDiameterAvpExternal_Identifier alloc]initWithAvp:avp];
            _var_external_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpActive_Time avpCode])
        {
            avp = [[UMDiameterAvpActive_Time alloc]initWithAvp:avp];
            _var_active_time = avp;
            [knownAVPs addObject:avp];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

