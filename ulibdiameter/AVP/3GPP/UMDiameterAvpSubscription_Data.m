//
//  UMDiameterAvpSubscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_subscriber_status)
    {
        [arr addObject:_subscriber_status]
    }
    if(_msisdn)
    {
        [arr addObject:_msisdn]
    }
    if(_a_msisdn)
    {
        [arr addObject:_a_msisdn]
    }
    if(_stn_sr)
    {
        [arr addObject:_stn_sr]
    }
    if(_ics_indicator)
    {
        [arr addObject:_ics_indicator]
    }
    if(_network_access_mode)
    {
        [arr addObject:_network_access_mode]
    }
    if(_operator_determined_barring)
    {
        [arr addObject:_operator_determined_barring]
    }
    if(_hplmn_odb)
    {
        [arr addObject:_hplmn_odb]
    }
    if(_regional_subscription_zone_code.count > 0)
    {
        for(UMDiameterAvpRegional_Subscription_Zone_Code *o in _regional_subscription_zone_code)
        {
            [arr addObject:o]
        }
    }
    if(_access_restriction_data)
    {
        [arr addObject:_access_restriction_data]
    }
    if(_apn_oi_replacement)
    {
        [arr addObject:_apn_oi_replacement]
    }
    if(_lcs_info)
    {
        [arr addObject:_lcs_info]
    }
    if(_teleservice_list)
    {
        [arr addObject:_teleservice_list]
    }
    if(_call_barring_info.count > 0)
    {
        for(UMDiameterAvpCall_Barring_Info *o in _call_barring_info)
        {
            [arr addObject:o]
        }
    }
    if(_3gpp_charging_characteristics)
    {
        [arr addObject:_3gpp_charging_characteristics]
    }
    if(_ambr)
    {
        [arr addObject:_ambr]
    }
    if(_apn_configuration_profile)
    {
        [arr addObject:_apn_configuration_profile]
    }
    if(_rat_frequency_selection_priority_id)
    {
        [arr addObject:_rat_frequency_selection_priority_id]
    }
    if(_trace_data)
    {
        [arr addObject:_trace_data]
    }
    if(_gprs_subscription_data)
    {
        [arr addObject:_gprs_subscription_data]
    }
    if(_csg_subscription_data.count > 0)
    {
        for(UMDiameterAvpCSG_Subscription_Data *o in _csg_subscription_data)
        {
            [arr addObject:o]
        }
    }
    if(_roaming_restricted_due_to_unsupported_feature)
    {
        [arr addObject:_roaming_restricted_due_to_unsupported_feature]
    }
    if(_subscribed_periodic_rau_tau_timer)
    {
        [arr addObject:_subscribed_periodic_rau_tau_timer]
    }
    if(_mps_priority)
    {
        [arr addObject:_mps_priority]
    }
    if(_vplmn_lipa_allowed)
    {
        [arr addObject:_vplmn_lipa_allowed]
    }
    if(_relay_node_indicator)
    {
        [arr addObject:_relay_node_indicator]
    }
    if(_mdt_user_consent)
    {
        [arr addObject:_mdt_user_consent]
    }
    if(_subscribed_vsrvcc)
    {
        [arr addObject:_subscribed_vsrvcc]
    }
    if(_prose_subscription_data)
    {
        [arr addObject:_prose_subscription_data]
    }
    if(_subscription_data_flags)
    {
        [arr addObject:_subscription_data_flags]
    }
    if(_adjacent_access_restriction_data.count > 0)
    {
        for(UMDiameterAvpAdjacent_Access_Restriction_Data *o in _adjacent_access_restriction_data)
        {
            [arr addObject:o]
        }
    }
    if(_dl_buffering_suggested_packet_count)
    {
        [arr addObject:_dl_buffering_suggested_packet_count]
    }
    if(_imsi_group_id.count > 0)
    {
        for(UMDiameterAvpIMSI_Group_Id *o in _imsi_group_id)
        {
            [arr addObject:o]
        }
    }
    if(_ue_usage_type)
    {
        [arr addObject:_ue_usage_type]
    }
    if(_aese_communication_pattern.count > 0)
    {
        for(UMDiameterAvpAESE_Communication_Pattern *o in _aese_communication_pattern)
        {
            [arr addObject:o]
        }
    }
    if(_monitoring_event_configuration.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Configuration *o in _monitoring_event_configuration)
        {
            [arr addObject:o]
        }
    }
    if(_emergency_info)
    {
        [arr addObject:_emergency_info]
    }
    if(_v2x_subscription_data)
    {
        [arr addObject:_v2x_subscription_data]
    }
    if(_edrx_cycle_length.count > 0)
    {
        for(UMDiameterAvpeDRX_Cycle_Length *o in _edrx_cycle_length)
        {
            [arr addObject:o]
        }
    }
    if(_external_identifier)
    {
        [arr addObject:_external_identifier]
    }
    if(_active_time)
    {
        [arr addObject:_active_time]
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSubscriber_Status  avpCode])
        {
            avp = [[UMDiameterAvpSubscriber_Status alloc]initWithAvp:avp];
            _subscriber_status = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMSISDN avpCode])
        {
            avp = [[UMDiameterAvpMSISDN alloc]initWithAvp:avp];
            _msisdn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpA_MSISDN avpCode])
        {
            avp = [[UMDiameterAvpA_MSISDN alloc]initWithAvp:avp];
            _a_msisdn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSTN_SR avpCode])
        {
            avp = [[UMDiameterAvpSTN_SR alloc]initWithAvp:avp];
            _stn_sr = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpICS_Indicator avpCode])
        {
            avp = [[UMDiameterAvpICS_Indicator alloc]initWithAvp:avp];
            _ics_indicator = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNetwork_Access_Mode avpCode])
        {
            avp = [[UMDiameterAvpNetwork_Access_Mode alloc]initWithAvp:avp];
            _network_access_mode = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpOperator_Determined_Barring avpCode])
        {
            avp = [[UMDiameterAvpOperator_Determined_Barring alloc]initWithAvp:avp];
            _operator_determined_barring = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpHPLMN_ODB avpCode])
        {
            avp = [[UMDiameterAvpHPLMN_ODB alloc]initWithAvp:avp];
            _hplmn_odb = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRegional_Subscription_Zone_Code avpCode])
        {
            avp = [[UMDiameterAvpRegional_Subscription_Zone_Code alloc]initWithAvp:avp];
            _regional_subscription_zone_code = avp;
            [knownAVPs addObject:avp];
            if(_regional_subscription_zone_code == NULL)
            {
                _regional_subscription_zone_code = @[avp];
            }
            else
            {
                _regional_subscription_zone_code = [_regional_subscription_zone_code arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAccess_Restriction_Data avpCode])
        {
            avp = [[UMDiameterAvpAccess_Restriction_Data alloc]initWithAvp:avp];
            _access_restriction_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_OI_Replacement avpCode])
        {
            avp = [[UMDiameterAvpAPN_OI_Replacement alloc]initWithAvp:avp];
            _apn_oi_replacement = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_Info avpCode])
        {
            avp = [[UMDiameterAvpLCS_Info alloc]initWithAvp:avp];
            _lcs_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTeleservice_List avpCode])
        {
            avp = [[UMDiameterAvpTeleservice_List alloc]initWithAvp:avp];
            _teleservice_list = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCall_Barring_Info avpCode])
        {
            avp = [[UMDiameterAvpCall_Barring_Info alloc]initWithAvp:avp];
            _call_barring_info = avp;
            [knownAVPs addObject:avp];
            if(_call_barring_info == NULL)
            {
                _call_barring_info = @[avp];
            }
            else
            {
                _call_barring_info = [_call_barring_info arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_Charging_Characteristics avpCode])
        {
            avp = [[UMDiameterAvp3GPP_Charging_Characteristics alloc]initWithAvp:avp];
            _3gpp_charging_characteristics = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAMBR avpCode])
        {
            avp = [[UMDiameterAvpAMBR alloc]initWithAvp:avp];
            _ambr = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_Configuration_Profile avpCode])
        {
            avp = [[UMDiameterAvpAPN_Configuration_Profile alloc]initWithAvp:avp];
            _apn_configuration_profile = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRAT_Frequency_Selection_Priority_ID avpCode])
        {
            avp = [[UMDiameterAvpRAT_Frequency_Selection_Priority_ID alloc]initWithAvp:avp];
            _rat_frequency_selection_priority_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Data avpCode])
        {
            avp = [[UMDiameterAvpTrace_Data alloc]initWithAvp:avp];
            _trace_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGPRS_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpGPRS_Subscription_Data alloc]initWithAvp:avp];
            _gprs_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCSG_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpCSG_Subscription_Data alloc]initWithAvp:avp];
            _csg_subscription_data = avp;
            [knownAVPs addObject:avp];
            if(_csg_subscription_data == NULL)
            {
                _csg_subscription_data = @[avp];
            }
            else
            {
                _csg_subscription_data = [_csg_subscription_data arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature avpCode])
        {
            avp = [[UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature alloc]initWithAvp:avp];
            _roaming_restricted_due_to_unsupported_feature = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer avpCode])
        {
            avp = [[UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer alloc]initWithAvp:avp];
            _subscribed_periodic_rau_tau_timer = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMPS_Priority avpCode])
        {
            avp = [[UMDiameterAvpMPS_Priority alloc]initWithAvp:avp];
            _mps_priority = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_LIPA_Allowed avpCode])
        {
            avp = [[UMDiameterAvpVPLMN_LIPA_Allowed alloc]initWithAvp:avp];
            _vplmn_lipa_allowed = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRelay_Node_Indicator avpCode])
        {
            avp = [[UMDiameterAvpRelay_Node_Indicator alloc]initWithAvp:avp];
            _relay_node_indicator = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_User_Consent avpCode])
        {
            avp = [[UMDiameterAvpMDT_User_Consent alloc]initWithAvp:avp];
            _mdt_user_consent = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_VSRVCC avpCode])
        {
            avp = [[UMDiameterAvpSubscribed_VSRVCC alloc]initWithAvp:avp];
            _subscribed_vsrvcc = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpProSe_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpProSe_Subscription_Data alloc]initWithAvp:avp];
            _prose_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Data_Flags avpCode])
        {
            avp = [[UMDiameterAvpSubscription_Data_Flags alloc]initWithAvp:avp];
            _subscription_data_flags = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAdjacent_Access_Restriction_Data avpCode])
        {
            avp = [[UMDiameterAvpAdjacent_Access_Restriction_Data alloc]initWithAvp:avp];
            _adjacent_access_restriction_data = avp;
            [knownAVPs addObject:avp];
            if(_adjacent_access_restriction_data == NULL)
            {
                _adjacent_access_restriction_data = @[avp];
            }
            else
            {
                _adjacent_access_restriction_data = [_adjacent_access_restriction_data arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpDL_Buffering_Suggested_Packet_Count avpCode])
        {
            avp = [[UMDiameterAvpDL_Buffering_Suggested_Packet_Count alloc]initWithAvp:avp];
            _dl_buffering_suggested_packet_count = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpIMSI_Group_Id avpCode])
        {
            avp = [[UMDiameterAvpIMSI_Group_Id alloc]initWithAvp:avp];
            _imsi_group_id = avp;
            [knownAVPs addObject:avp];
            if(_imsi_group_id == NULL)
            {
                _imsi_group_id = @[avp];
            }
            else
            {
                _imsi_group_id = [_imsi_group_id arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUE_Usage_Type avpCode])
        {
            avp = [[UMDiameterAvpUE_Usage_Type alloc]initWithAvp:avp];
            _ue_usage_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAESE_Communication_Pattern avpCode])
        {
            avp = [[UMDiameterAvpAESE_Communication_Pattern alloc]initWithAvp:avp];
            _aese_communication_pattern = avp;
            [knownAVPs addObject:avp];
            if(_aese_communication_pattern == NULL)
            {
                _aese_communication_pattern = @[avp];
            }
            else
            {
                _aese_communication_pattern = [_aese_communication_pattern arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Event_Configuration avpCode])
        {
            avp = [[UMDiameterAvpMonitoring_Event_Configuration alloc]initWithAvp:avp];
            _monitoring_event_configuration = avp;
            [knownAVPs addObject:avp];
            if(_monitoring_event_configuration == NULL)
            {
                _monitoring_event_configuration = @[avp];
            }
            else
            {
                _monitoring_event_configuration = [_monitoring_event_configuration arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpEmergency_Info avpCode])
        {
            avp = [[UMDiameterAvpEmergency_Info alloc]initWithAvp:avp];
            _emergency_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpV2X_Subscription_Data avpCode])
        {
            avp = [[UMDiameterAvpV2X_Subscription_Data alloc]initWithAvp:avp];
            _v2x_subscription_data = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpeDRX_Cycle_Length avpCode])
        {
            avp = [[UMDiameterAvpeDRX_Cycle_Length alloc]initWithAvp:avp];
            _edrx_cycle_length = avp;
            [knownAVPs addObject:avp];
            if(_edrx_cycle_length == NULL)
            {
                _edrx_cycle_length = @[avp];
            }
            else
            {
                _edrx_cycle_length = [_edrx_cycle_length arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Identifier avpCode])
        {
            avp = [[UMDiameterAvpExternal_Identifier alloc]initWithAvp:avp];
            _external_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpActive_Time avpCode])
        {
            avp = [[UMDiameterAvpActive_Time alloc]initWithAvp:avp];
            _active_time = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

