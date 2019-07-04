//
//  UMDiameterAvpSubscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSubscriber_Status  avpCode])
        {
            _var_subscriber_status = [[UMDiameterAvpSubscriber_Status alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscriber_status];
        }
        else if(avp.avpCode == [UMDiameterAvpMSISDN avpCode])
        {
            _var_msisdn = [[UMDiameterAvpMSISDN alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_msisdn];
        }
        else if(avp.avpCode == [UMDiameterAvpA_MSISDN avpCode])
        {
            _var_a_msisdn = [[UMDiameterAvpA_MSISDN alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_a_msisdn];
        }
        else if(avp.avpCode == [UMDiameterAvpSTN_SR avpCode])
        {
            _var_stn_sr = [[UMDiameterAvpSTN_SR alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_stn_sr];
        }
        else if(avp.avpCode == [UMDiameterAvpICS_Indicator avpCode])
        {
            _var_ics_indicator = [[UMDiameterAvpICS_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ics_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpNetwork_Access_Mode avpCode])
        {
            _var_network_access_mode = [[UMDiameterAvpNetwork_Access_Mode alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_network_access_mode];
        }
        else if(avp.avpCode == [UMDiameterAvpOperator_Determined_Barring avpCode])
        {
            _var_operator_determined_barring = [[UMDiameterAvpOperator_Determined_Barring alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_operator_determined_barring];
        }
        else if(avp.avpCode == [UMDiameterAvpHPLMN_ODB avpCode])
        {
            _var_hplmn_odb = [[UMDiameterAvpHPLMN_ODB alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_hplmn_odb];
        }
        else if(avp.avpCode == [UMDiameterAvpRegional_Subscription_Zone_Code avpCode])
        {
            UMDiameterAvpRegional_Subscription_Zone_Code *avp2 = [[UMDiameterAvpRegional_Subscription_Zone_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_regional_subscription_zone_code == NULL)
            {
                _var_regional_subscription_zone_code = @[avp2];
            }
            else
            {
                _var_regional_subscription_zone_code = [_var_regional_subscription_zone_code arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAccess_Restriction_Data avpCode])
        {
            _var_access_restriction_data = [[UMDiameterAvpAccess_Restriction_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_access_restriction_data];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_OI_Replacement avpCode])
        {
            _var_apn_oi_replacement = [[UMDiameterAvpAPN_OI_Replacement alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_apn_oi_replacement];
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_Info avpCode])
        {
            _var_lcs_info = [[UMDiameterAvpLCS_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lcs_info];
        }
        else if(avp.avpCode == [UMDiameterAvpTeleservice_List avpCode])
        {
            _var_teleservice_list = [[UMDiameterAvpTeleservice_List alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_teleservice_list];
        }
        else if(avp.avpCode == [UMDiameterAvpCall_Barring_Info avpCode])
        {
            UMDiameterAvpCall_Barring_Info *avp2 = [[UMDiameterAvpCall_Barring_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_call_barring_info == NULL)
            {
                _var_call_barring_info = @[avp2];
            }
            else
            {
                _var_call_barring_info = [_var_call_barring_info arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_Charging_Characteristics avpCode])
        {
            _var_3gpp_charging_characteristics = [[UMDiameterAvp3GPP_Charging_Characteristics alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_3gpp_charging_characteristics];
        }
        else if(avp.avpCode == [UMDiameterAvpAMBR avpCode])
        {
            _var_ambr = [[UMDiameterAvpAMBR alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ambr];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_Configuration_Profile avpCode])
        {
            _var_apn_configuration_profile = [[UMDiameterAvpAPN_Configuration_Profile alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_apn_configuration_profile];
        }
        else if(avp.avpCode == [UMDiameterAvpRAT_Frequency_Selection_Priority_ID avpCode])
        {
            _var_rat_frequency_selection_priority_id = [[UMDiameterAvpRAT_Frequency_Selection_Priority_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_rat_frequency_selection_priority_id];
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Data avpCode])
        {
            _var_trace_data = [[UMDiameterAvpTrace_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_trace_data];
        }
        else if(avp.avpCode == [UMDiameterAvpGPRS_Subscription_Data avpCode])
        {
            _var_gprs_subscription_data = [[UMDiameterAvpGPRS_Subscription_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_gprs_subscription_data];
        }
        else if(avp.avpCode == [UMDiameterAvpCSG_Subscription_Data avpCode])
        {
            UMDiameterAvpCSG_Subscription_Data *avp2 = [[UMDiameterAvpCSG_Subscription_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_csg_subscription_data == NULL)
            {
                _var_csg_subscription_data = @[avp2];
            }
            else
            {
                _var_csg_subscription_data = [_var_csg_subscription_data arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature avpCode])
        {
            _var_roaming_restricted_due_to_unsupported_feature = [[UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_roaming_restricted_due_to_unsupported_feature];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer avpCode])
        {
            _var_subscribed_periodic_rau_tau_timer = [[UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscribed_periodic_rau_tau_timer];
        }
        else if(avp.avpCode == [UMDiameterAvpMPS_Priority avpCode])
        {
            _var_mps_priority = [[UMDiameterAvpMPS_Priority alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mps_priority];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_LIPA_Allowed avpCode])
        {
            _var_vplmn_lipa_allowed = [[UMDiameterAvpVPLMN_LIPA_Allowed alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vplmn_lipa_allowed];
        }
        else if(avp.avpCode == [UMDiameterAvpRelay_Node_Indicator avpCode])
        {
            _var_relay_node_indicator = [[UMDiameterAvpRelay_Node_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_relay_node_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_User_Consent avpCode])
        {
            _var_mdt_user_consent = [[UMDiameterAvpMDT_User_Consent alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mdt_user_consent];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscribed_VSRVCC avpCode])
        {
            _var_subscribed_vsrvcc = [[UMDiameterAvpSubscribed_VSRVCC alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscribed_vsrvcc];
        }
        else if(avp.avpCode == [UMDiameterAvpProSe_Subscription_Data avpCode])
        {
            _var_prose_subscription_data = [[UMDiameterAvpProSe_Subscription_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_prose_subscription_data];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Data_Flags avpCode])
        {
            _var_subscription_data_flags = [[UMDiameterAvpSubscription_Data_Flags alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscription_data_flags];
        }
        else if(avp.avpCode == [UMDiameterAvpAdjacent_Access_Restriction_Data avpCode])
        {
            UMDiameterAvpAdjacent_Access_Restriction_Data *avp2 = [[UMDiameterAvpAdjacent_Access_Restriction_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_adjacent_access_restriction_data == NULL)
            {
                _var_adjacent_access_restriction_data = @[avp2];
            }
            else
            {
                _var_adjacent_access_restriction_data = [_var_adjacent_access_restriction_data arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpDL_Buffering_Suggested_Packet_Count avpCode])
        {
            _var_dl_buffering_suggested_packet_count = [[UMDiameterAvpDL_Buffering_Suggested_Packet_Count alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_dl_buffering_suggested_packet_count];
        }
        else if(avp.avpCode == [UMDiameterAvpIMSI_Group_Id avpCode])
        {
            UMDiameterAvpIMSI_Group_Id *avp2 = [[UMDiameterAvpIMSI_Group_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_imsi_group_id == NULL)
            {
                _var_imsi_group_id = @[avp2];
            }
            else
            {
                _var_imsi_group_id = [_var_imsi_group_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUE_Usage_Type avpCode])
        {
            _var_ue_usage_type = [[UMDiameterAvpUE_Usage_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ue_usage_type];
        }
        else if(avp.avpCode == [UMDiameterAvpAESE_Communication_Pattern avpCode])
        {
            UMDiameterAvpAESE_Communication_Pattern *avp2 = [[UMDiameterAvpAESE_Communication_Pattern alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_aese_communication_pattern == NULL)
            {
                _var_aese_communication_pattern = @[avp2];
            }
            else
            {
                _var_aese_communication_pattern = [_var_aese_communication_pattern arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Event_Configuration avpCode])
        {
            UMDiameterAvpMonitoring_Event_Configuration *avp2 = [[UMDiameterAvpMonitoring_Event_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_monitoring_event_configuration == NULL)
            {
                _var_monitoring_event_configuration = @[avp2];
            }
            else
            {
                _var_monitoring_event_configuration = [_var_monitoring_event_configuration arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpEmergency_Info avpCode])
        {
            _var_emergency_info = [[UMDiameterAvpEmergency_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_emergency_info];
        }
        else if(avp.avpCode == [UMDiameterAvpV2X_Subscription_Data avpCode])
        {
            _var_v2x_subscription_data = [[UMDiameterAvpV2X_Subscription_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_v2x_subscription_data];
        }
        else if(avp.avpCode == [UMDiameterAvpeDRX_Cycle_Length avpCode])
        {
            UMDiameterAvpeDRX_Cycle_Length *avp2 = [[UMDiameterAvpeDRX_Cycle_Length alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_edrx_cycle_length == NULL)
            {
                _var_edrx_cycle_length = @[avp2];
            }
            else
            {
                _var_edrx_cycle_length = [_var_edrx_cycle_length arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Identifier avpCode])
        {
            _var_external_identifier = [[UMDiameterAvpExternal_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_external_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpActive_Time avpCode])
        {
            _var_active_time = [[UMDiameterAvpActive_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_active_time];
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

