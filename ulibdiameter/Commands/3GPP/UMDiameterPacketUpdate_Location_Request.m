//
//  UMDiameterPacketUpdate_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2021-03-23 03:34:00.574712
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketUpdate_Location_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpULR_Flags.h"
#import "UMDiameterAvpUE_SRVCC_Capability.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpSGSN_Number.h"
#import "UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpActive_APN.h"
#import "UMDiameterAvpEquivalent_PLMN_List.h"
#import "UMDiameterAvpMME_Number_for_MT_SMS.h"
#import "UMDiameterAvpSMS_Register_Request.h"
#import "UMDiameterAvpSGs_MME_Identity.h"
#import "UMDiameterAvpCoupled_Node_Diameter_ID.h"
#import "UMDiameterAvpAdjacent_PLMNs.h"
#import "UMDiameterAvpSupported_Services.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketUpdate_Location_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 316;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = 16777251;
}

+ (uint32_t)commandCode
{
    return 316;
}

+ (uint32_t)defaultApplicationId
{
    return 16777251;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_session_id)
    {
        [_var_session_id beforeEncode];
        [arr addObject:_var_session_id];
    }
    if(_var_drmp)
    {
        [_var_drmp beforeEncode];
        [arr addObject:_var_drmp];
    }
    if(_var_vendor_specific_application_id)
    {
        [_var_vendor_specific_application_id beforeEncode];
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_auth_session_state)
    {
        [_var_auth_session_state beforeEncode];
        [arr addObject:_var_auth_session_state];
    }
    if(_var_origin_host)
    {
        [_var_origin_host beforeEncode];
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [_var_origin_realm beforeEncode];
        [arr addObject:_var_origin_realm];
    }
    if(_var_destination_host)
    {
        [_var_destination_host beforeEncode];
        [arr addObject:_var_destination_host];
    }
    if(_var_destination_realm)
    {
        [_var_destination_realm beforeEncode];
        [arr addObject:_var_destination_realm];
    }
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_oc_supported_features)
    {
        [_var_oc_supported_features beforeEncode];
        [arr addObject:_var_oc_supported_features];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_terminal_information)
    {
        [_var_terminal_information beforeEncode];
        [arr addObject:_var_terminal_information];
    }
    if(_var_rat_type)
    {
        [_var_rat_type beforeEncode];
        [arr addObject:_var_rat_type];
    }
    if(_var_ulr_flags)
    {
        [_var_ulr_flags beforeEncode];
        [arr addObject:_var_ulr_flags];
    }
    if(_var_ue_srvcc_capability)
    {
        [_var_ue_srvcc_capability beforeEncode];
        [arr addObject:_var_ue_srvcc_capability];
    }
    if(_var_visited_plmn_id)
    {
        [_var_visited_plmn_id beforeEncode];
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_sgsn_number)
    {
        [_var_sgsn_number beforeEncode];
        [arr addObject:_var_sgsn_number];
    }
    if(_var_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [_var_homogeneous_support_of_ims_voice_over_ps_sessions beforeEncode];
        [arr addObject:_var_homogeneous_support_of_ims_voice_over_ps_sessions];
    }
    if(_var_gmlc_address)
    {
        [_var_gmlc_address beforeEncode];
        [arr addObject:_var_gmlc_address];
    }
    if(_var_active_apn.count > 0)
    {
        for(UMDiameterAvpActive_APN *o in _var_active_apn)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_equivalent_plmn_list)
    {
        [_var_equivalent_plmn_list beforeEncode];
        [arr addObject:_var_equivalent_plmn_list];
    }
    if(_var_mme_number_for_mt_sms)
    {
        [_var_mme_number_for_mt_sms beforeEncode];
        [arr addObject:_var_mme_number_for_mt_sms];
    }
    if(_var_sms_register_request)
    {
        [_var_sms_register_request beforeEncode];
        [arr addObject:_var_sms_register_request];
    }
    if(_var_sgs_mme_identity)
    {
        [_var_sgs_mme_identity beforeEncode];
        [arr addObject:_var_sgs_mme_identity];
    }
    if(_var_coupled_node_diameter_id)
    {
        [_var_coupled_node_diameter_id beforeEncode];
        [arr addObject:_var_coupled_node_diameter_id];
    }
    if(_var_adjacent_plmns)
    {
        [_var_adjacent_plmns beforeEncode];
        [arr addObject:_var_adjacent_plmns];
    }
    if(_var_supported_services)
    {
        [_var_supported_services beforeEncode];
        [arr addObject:_var_supported_services];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _var_proxy_info)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_route_record.count > 0)
    {
        for(UMDiameterAvpRoute_Record *o in _var_route_record)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


- (void)setDictionaryValue:(NSDictionary *)dict
{

    if(dict[@"session-id"])
    {
        _var_session_id = [[UMDiameterAvpSession_Id alloc]init];
        _var_session_id.objectValue = dict[@"session-id"];
    }

    if(dict[@"drmp"])
    {
        _var_drmp = [[UMDiameterAvpDRMP alloc]init];
        _var_drmp.objectValue = dict[@"drmp"];
    }

    if(dict[@"vendor-specific-application-id"])
    {
        _var_vendor_specific_application_id = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
        _var_vendor_specific_application_id.objectValue = dict[@"vendor-specific-application-id"];
    }

    if(dict[@"auth-session-state"])
    {
        _var_auth_session_state = [[UMDiameterAvpAuth_Session_State alloc]init];
        _var_auth_session_state.objectValue = dict[@"auth-session-state"];
    }

    if(dict[@"origin-host"])
    {
        _var_origin_host = [[UMDiameterAvpOrigin_Host alloc]init];
        _var_origin_host.objectValue = dict[@"origin-host"];
    }

    if(dict[@"origin-realm"])
    {
        _var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]init];
        _var_origin_realm.objectValue = dict[@"origin-realm"];
    }

    if(dict[@"destination-host"])
    {
        _var_destination_host = [[UMDiameterAvpDestination_Host alloc]init];
        _var_destination_host.objectValue = dict[@"destination-host"];
    }

    if(dict[@"destination-realm"])
    {
        _var_destination_realm = [[UMDiameterAvpDestination_Realm alloc]init];
        _var_destination_realm.objectValue = dict[@"destination-realm"];
    }

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"oc-supported-features"])
    {
        _var_oc_supported_features = [[UMDiameterAvpOC_Supported_Features alloc]init];
        _var_oc_supported_features.objectValue = dict[@"oc-supported-features"];
    }

    if(dict[@"supported-features"])
    {
        id obj = dict[@"supported-features"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpSupported_Features *o = [[UMDiameterAvpSupported_Features alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_supported_features = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpSupported_Features *o = [[UMDiameterAvpSupported_Features alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_supported_features = arr;
        }
    }
    if(dict[@"terminal-information"])
    {
        _var_terminal_information = [[UMDiameterAvpTerminal_Information alloc]init];
        _var_terminal_information.objectValue = dict[@"terminal-information"];
    }

    if(dict[@"rat-type"])
    {
        _var_rat_type = [[UMDiameterAvpRAT_Type alloc]init];
        _var_rat_type.objectValue = dict[@"rat-type"];
    }

    if(dict[@"ulr-flags"])
    {
        _var_ulr_flags = [[UMDiameterAvpULR_Flags alloc]init];
        _var_ulr_flags.objectValue = dict[@"ulr-flags"];
    }

    if(dict[@"ue-srvcc-capability"])
    {
        _var_ue_srvcc_capability = [[UMDiameterAvpUE_SRVCC_Capability alloc]init];
        _var_ue_srvcc_capability.objectValue = dict[@"ue-srvcc-capability"];
    }

    if(dict[@"visited-plmn-id"])
    {
        _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]init];
        _var_visited_plmn_id.objectValue = dict[@"visited-plmn-id"];
    }

    if(dict[@"sgsn-number"])
    {
        _var_sgsn_number = [[UMDiameterAvpSGSN_Number alloc]init];
        _var_sgsn_number.objectValue = dict[@"sgsn-number"];
    }

    if(dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"])
    {
        _var_homogeneous_support_of_ims_voice_over_ps_sessions = [[UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions alloc]init];
        _var_homogeneous_support_of_ims_voice_over_ps_sessions.objectValue = dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"];
    }

    if(dict[@"gmlc-address"])
    {
        _var_gmlc_address = [[UMDiameterAvpGMLC_Address alloc]init];
        _var_gmlc_address.objectValue = dict[@"gmlc-address"];
    }

    if(dict[@"active-apn"])
    {
        id obj = dict[@"active-apn"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpActive_APN *o = [[UMDiameterAvpActive_APN alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_active_apn = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpActive_APN *o = [[UMDiameterAvpActive_APN alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_active_apn = arr;
        }
    }
    if(dict[@"equivalent-plmn-list"])
    {
        _var_equivalent_plmn_list = [[UMDiameterAvpEquivalent_PLMN_List alloc]init];
        _var_equivalent_plmn_list.objectValue = dict[@"equivalent-plmn-list"];
    }

    if(dict[@"mme-number-for-mt-sms"])
    {
        _var_mme_number_for_mt_sms = [[UMDiameterAvpMME_Number_for_MT_SMS alloc]init];
        _var_mme_number_for_mt_sms.objectValue = dict[@"mme-number-for-mt-sms"];
    }

    if(dict[@"sms-register-request"])
    {
        _var_sms_register_request = [[UMDiameterAvpSMS_Register_Request alloc]init];
        _var_sms_register_request.objectValue = dict[@"sms-register-request"];
    }

    if(dict[@"sgs-mme-identity"])
    {
        _var_sgs_mme_identity = [[UMDiameterAvpSGs_MME_Identity alloc]init];
        _var_sgs_mme_identity.objectValue = dict[@"sgs-mme-identity"];
    }

    if(dict[@"coupled-node-diameter-id"])
    {
        _var_coupled_node_diameter_id = [[UMDiameterAvpCoupled_Node_Diameter_ID alloc]init];
        _var_coupled_node_diameter_id.objectValue = dict[@"coupled-node-diameter-id"];
    }

    if(dict[@"adjacent-plmns"])
    {
        _var_adjacent_plmns = [[UMDiameterAvpAdjacent_PLMNs alloc]init];
        _var_adjacent_plmns.objectValue = dict[@"adjacent-plmns"];
    }

    if(dict[@"supported-services"])
    {
        _var_supported_services = [[UMDiameterAvpSupported_Services alloc]init];
        _var_supported_services.objectValue = dict[@"supported-services"];
    }

    if(dict[@"avp"])
    {
        id obj = dict[@"avp"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_avp = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_avp = arr;
        }
    }
    if(dict[@"proxy-info"])
    {
        id obj = dict[@"proxy-info"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpProxy_Info *o = [[UMDiameterAvpProxy_Info alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_proxy_info = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpProxy_Info *o = [[UMDiameterAvpProxy_Info alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_proxy_info = arr;
        }
    }
    if(dict[@"route-record"])
    {
        id obj = dict[@"route-record"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpRoute_Record *o = [[UMDiameterAvpRoute_Record alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_route_record = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpRoute_Record *o = [[UMDiameterAvpRoute_Record alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_route_record = arr;
        }
    }
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_var_session_id)
    {
        dict[@"session-id"] = _var_session_id.objectValue;
    }
    if(_var_drmp)
    {
        dict[@"drmp"] = _var_drmp.objectValue;
    }
    if(_var_vendor_specific_application_id)
    {
        dict[@"vendor-specific-application-id"] = _var_vendor_specific_application_id.objectValue;
    }
    if(_var_auth_session_state)
    {
        dict[@"auth-session-state"] = _var_auth_session_state.objectValue;
    }
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_destination_host)
    {
        dict[@"destination-host"] = _var_destination_host.objectValue;
    }
    if(_var_destination_realm)
    {
        dict[@"destination-realm"] = _var_destination_realm.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_oc_supported_features)
    {
        dict[@"oc-supported-features"] = _var_oc_supported_features.objectValue;
    }
    if(_var_supported_features)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_features)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-features"] = arr;
    }
    if(_var_terminal_information)
    {
        dict[@"terminal-information"] = _var_terminal_information.objectValue;
    }
    if(_var_rat_type)
    {
        dict[@"rat-type"] = _var_rat_type.objectValue;
    }
    if(_var_ulr_flags)
    {
        dict[@"ulr-flags"] = _var_ulr_flags.objectValue;
    }
    if(_var_ue_srvcc_capability)
    {
        dict[@"ue-srvcc-capability"] = _var_ue_srvcc_capability.objectValue;
    }
    if(_var_visited_plmn_id)
    {
        dict[@"visited-plmn-id"] = _var_visited_plmn_id.objectValue;
    }
    if(_var_sgsn_number)
    {
        dict[@"sgsn-number"] = _var_sgsn_number.objectValue;
    }
    if(_var_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"] = _var_homogeneous_support_of_ims_voice_over_ps_sessions.objectValue;
    }
    if(_var_gmlc_address)
    {
        dict[@"gmlc-address"] = _var_gmlc_address.objectValue;
    }
    if(_var_active_apn)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_active_apn)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"active-apn"] = arr;
    }
    if(_var_equivalent_plmn_list)
    {
        dict[@"equivalent-plmn-list"] = _var_equivalent_plmn_list.objectValue;
    }
    if(_var_mme_number_for_mt_sms)
    {
        dict[@"mme-number-for-mt-sms"] = _var_mme_number_for_mt_sms.objectValue;
    }
    if(_var_sms_register_request)
    {
        dict[@"sms-register-request"] = _var_sms_register_request.objectValue;
    }
    if(_var_sgs_mme_identity)
    {
        dict[@"sgs-mme-identity"] = _var_sgs_mme_identity.objectValue;
    }
    if(_var_coupled_node_diameter_id)
    {
        dict[@"coupled-node-diameter-id"] = _var_coupled_node_diameter_id.objectValue;
    }
    if(_var_adjacent_plmns)
    {
        dict[@"adjacent-plmns"] = _var_adjacent_plmns.objectValue;
    }
    if(_var_supported_services)
    {
        dict[@"supported-services"] = _var_supported_services.objectValue;
    }
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
    }
    if(_var_proxy_info)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_proxy_info)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"proxy-info"] = arr;
    }
    if(_var_route_record)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_route_record)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"route-record"] = arr;
    }
    return dict;
}

+ (void)webDiameterParameters:(NSMutableString *)s
{


    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpDRMP appendWebDiameterParameters:s webName:@"drmp"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpTerminal_Information appendWebDiameterParameters:s webName:@"terminal-information"  comment:@"" css:@"optional"];

    [UMDiameterAvpRAT_Type appendWebDiameterParameters:s webName:@"rat-type"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpULR_Flags appendWebDiameterParameters:s webName:@"ulr-flags"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUE_SRVCC_Capability appendWebDiameterParameters:s webName:@"ue-srvcc-capability"  comment:@"" css:@"optional"];

    [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:@"visited-plmn-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpSGSN_Number appendWebDiameterParameters:s webName:@"sgsn-number"  comment:@"" css:@"optional"];

    [UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions appendWebDiameterParameters:s webName:@"homogeneous-support-of-ims-voice-over-ps-sessions"  comment:@"" css:@"optional"];

    [UMDiameterAvpGMLC_Address appendWebDiameterParameters:s webName:@"gmlc-address"  comment:@"" css:@"optional"];

    [UMDiameterAvpActive_APN appendWebDiameterParameters:s webName:@"active-apn[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpEquivalent_PLMN_List appendWebDiameterParameters:s webName:@"equivalent-plmn-list"  comment:@"" css:@"optional"];

    [UMDiameterAvpMME_Number_for_MT_SMS appendWebDiameterParameters:s webName:@"mme-number-for-mt-sms"  comment:@"" css:@"optional"];

    [UMDiameterAvpSMS_Register_Request appendWebDiameterParameters:s webName:@"sms-register-request"  comment:@"" css:@"optional"];

    [UMDiameterAvpSGs_MME_Identity appendWebDiameterParameters:s webName:@"sgs-mme-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpCoupled_Node_Diameter_ID appendWebDiameterParameters:s webName:@"coupled-node-diameter-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAdjacent_PLMNs appendWebDiameterParameters:s webName:@"adjacent-plmns"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Services appendWebDiameterParameters:s webName:@"supported-services"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record[]"  comment:@"" css:@"optional"];

}

- (void)afterDecode
{
    [super afterDecode];
    for(UMDiameterAvp *avp in _packet_avps)
    {
        if(avp.avpCode == [UMDiameterAvpSession_Id avpCode])
        {
            UMDiameterAvpSession_Id *avp2 = [[UMDiameterAvpSession_Id alloc]initWithAvp:avp];
            _var_session_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDRMP avpCode])
        {
            UMDiameterAvpDRMP *avp2 = [[UMDiameterAvpDRMP alloc]initWithAvp:avp];
            _var_drmp = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            _var_vendor_specific_application_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAuth_Session_State avpCode])
        {
            UMDiameterAvpAuth_Session_State *avp2 = [[UMDiameterAvpAuth_Session_State alloc]initWithAvp:avp];
            _var_auth_session_state = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOrigin_Host avpCode])
        {
            UMDiameterAvpOrigin_Host *avp2 = [[UMDiameterAvpOrigin_Host alloc]initWithAvp:avp];
            _var_origin_host = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOrigin_Realm avpCode])
        {
            UMDiameterAvpOrigin_Realm *avp2 = [[UMDiameterAvpOrigin_Realm alloc]initWithAvp:avp];
            _var_origin_realm = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_Host avpCode])
        {
            UMDiameterAvpDestination_Host *avp2 = [[UMDiameterAvpDestination_Host alloc]initWithAvp:avp];
            _var_destination_host = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_Realm avpCode])
        {
            UMDiameterAvpDestination_Realm *avp2 = [[UMDiameterAvpDestination_Realm alloc]initWithAvp:avp];
            _var_destination_realm = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpUser_Name avpCode])
        {
            UMDiameterAvpUser_Name *avp2 = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            _var_user_name = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Supported_Features avpCode])
        {
            UMDiameterAvpOC_Supported_Features *avp2 = [[UMDiameterAvpOC_Supported_Features alloc]initWithAvp:avp];
            _var_oc_supported_features = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSupported_Features avpCode])
        {
            UMDiameterAvpSupported_Features *avp2 = [[UMDiameterAvpSupported_Features alloc]initWithAvp:avp];
            if(_var_supported_features == NULL)
            {
                _var_supported_features = (NSArray<UMDiameterAvpSupported_Features *>*)@[avp2];
            }
            else
            {
                _var_supported_features = [_var_supported_features arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTerminal_Information avpCode])
        {
            UMDiameterAvpTerminal_Information *avp2 = [[UMDiameterAvpTerminal_Information alloc]initWithAvp:avp];
            _var_terminal_information = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpRAT_Type avpCode])
        {
            UMDiameterAvpRAT_Type *avp2 = [[UMDiameterAvpRAT_Type alloc]initWithAvp:avp];
            _var_rat_type = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpULR_Flags avpCode])
        {
            UMDiameterAvpULR_Flags *avp2 = [[UMDiameterAvpULR_Flags alloc]initWithAvp:avp];
            _var_ulr_flags = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpUE_SRVCC_Capability avpCode])
        {
            UMDiameterAvpUE_SRVCC_Capability *avp2 = [[UMDiameterAvpUE_SRVCC_Capability alloc]initWithAvp:avp];
            _var_ue_srvcc_capability = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            UMDiameterAvpVisited_PLMN_Id *avp2 = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _var_visited_plmn_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_Number avpCode])
        {
            UMDiameterAvpSGSN_Number *avp2 = [[UMDiameterAvpSGSN_Number alloc]initWithAvp:avp];
            _var_sgsn_number = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions avpCode])
        {
            UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions *avp2 = [[UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions alloc]initWithAvp:avp];
            _var_homogeneous_support_of_ims_voice_over_ps_sessions = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpGMLC_Address avpCode])
        {
            UMDiameterAvpGMLC_Address *avp2 = [[UMDiameterAvpGMLC_Address alloc]initWithAvp:avp];
            _var_gmlc_address = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpActive_APN avpCode])
        {
            UMDiameterAvpActive_APN *avp2 = [[UMDiameterAvpActive_APN alloc]initWithAvp:avp];
            if(_var_active_apn == NULL)
            {
                _var_active_apn = (NSArray<UMDiameterAvpActive_APN *>*)@[avp2];
            }
            else
            {
                _var_active_apn = [_var_active_apn arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpEquivalent_PLMN_List avpCode])
        {
            UMDiameterAvpEquivalent_PLMN_List *avp2 = [[UMDiameterAvpEquivalent_PLMN_List alloc]initWithAvp:avp];
            _var_equivalent_plmn_list = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpMME_Number_for_MT_SMS avpCode])
        {
            UMDiameterAvpMME_Number_for_MT_SMS *avp2 = [[UMDiameterAvpMME_Number_for_MT_SMS alloc]initWithAvp:avp];
            _var_mme_number_for_mt_sms = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSMS_Register_Request avpCode])
        {
            UMDiameterAvpSMS_Register_Request *avp2 = [[UMDiameterAvpSMS_Register_Request alloc]initWithAvp:avp];
            _var_sms_register_request = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSGs_MME_Identity avpCode])
        {
            UMDiameterAvpSGs_MME_Identity *avp2 = [[UMDiameterAvpSGs_MME_Identity alloc]initWithAvp:avp];
            _var_sgs_mme_identity = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpCoupled_Node_Diameter_ID avpCode])
        {
            UMDiameterAvpCoupled_Node_Diameter_ID *avp2 = [[UMDiameterAvpCoupled_Node_Diameter_ID alloc]initWithAvp:avp];
            _var_coupled_node_diameter_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAdjacent_PLMNs avpCode])
        {
            UMDiameterAvpAdjacent_PLMNs *avp2 = [[UMDiameterAvpAdjacent_PLMNs alloc]initWithAvp:avp];
            _var_adjacent_plmns = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSupported_Services avpCode])
        {
            UMDiameterAvpSupported_Services *avp2 = [[UMDiameterAvpSupported_Services alloc]initWithAvp:avp];
            _var_supported_services = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpProxy_Info avpCode])
        {
            UMDiameterAvpProxy_Info *avp2 = [[UMDiameterAvpProxy_Info alloc]initWithAvp:avp];
            if(_var_proxy_info == NULL)
            {
                _var_proxy_info = (NSArray<UMDiameterAvpProxy_Info *>*)@[avp2];
            }
            else
            {
                _var_proxy_info = [_var_proxy_info arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRoute_Record avpCode])
        {
            UMDiameterAvpRoute_Record *avp2 = [[UMDiameterAvpRoute_Record alloc]initWithAvp:avp];
            if(_var_route_record == NULL)
            {
                _var_route_record = (NSArray<UMDiameterAvpRoute_Record *>*)@[avp2];
            }
            else
            {
                _var_route_record = [_var_route_record arrayByAddingObject:avp2];
            }
        }
        else
        {
            if(_unknown_avps == NULL)
            {
                _unknown_avps = [[UMSynchronizedArray alloc]init];
            }
            [_unknown_avps addObject:avp];
        }
    }
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Session-Id"] = [_var_session_id objectValue];
	dict[@"DRMP"] = [_var_drmp objectValue];
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"OC-Supported-Features"] = [_var_oc_supported_features objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_supported_features.count>0)
		{
			for(UMDiameterAvp *avp in _var_supported_features)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Supported-Features"] = arr;
		}
	}
	dict[@"Terminal-Information"] = [_var_terminal_information objectValue];
	dict[@"RAT-Type"] = [_var_rat_type objectValue];
	dict[@"ULR-Flags"] = [_var_ulr_flags objectValue];
	dict[@"UE-SRVCC-Capability"] = [_var_ue_srvcc_capability objectValue];
	dict[@"Visited-PLMN-Id"] = [_var_visited_plmn_id objectValue];
	dict[@"SGSN-Number"] = [_var_sgsn_number objectValue];
	dict[@"Homogeneous-Support-of-IMS-Voice-Over-PS-Sessions"] = [_var_homogeneous_support_of_ims_voice_over_ps_sessions objectValue];
	dict[@"GMLC-Address"] = [_var_gmlc_address objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_active_apn.count>0)
		{
			for(UMDiameterAvp *avp in _var_active_apn)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Active-APN"] = arr;
		}
	}
	dict[@"Equivalent-PLMN-List"] = [_var_equivalent_plmn_list objectValue];
	dict[@"MME-Number-for-MT-SMS"] = [_var_mme_number_for_mt_sms objectValue];
	dict[@"SMS-Register-Request"] = [_var_sms_register_request objectValue];
	dict[@"SGs-MME-Identity"] = [_var_sgs_mme_identity objectValue];
	dict[@"Coupled-Node-Diameter-ID"] = [_var_coupled_node_diameter_id objectValue];
	dict[@"Adjacent-PLMNs"] = [_var_adjacent_plmns objectValue];
	dict[@"Supported-Services"] = [_var_supported_services objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_proxy_info.count>0)
		{
			for(UMDiameterAvp *avp in _var_proxy_info)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Proxy-Info"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_route_record.count>0)
		{
			for(UMDiameterAvp *avp in _var_route_record)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Route-Record"] = arr;
		}
	}
	return dict;
}

+ (NSString *)webJsonDefintion
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSession_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDRMP definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Specific_Application_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAuth_Session_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Supported_Features definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Features definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTerminal_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRAT_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpULR_Flags definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUE_SRVCC_Capability definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGMLC_Address definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpActive_APN definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEquivalent_PLMN_List definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_Number_for_MT_SMS definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSMS_Register_Request definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGs_MME_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCoupled_Node_Diameter_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAdjacent_PLMNs definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Services definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProxy_Info definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRoute_Record definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }

    UMSynchronizedSortedDictionary *commandDef = [[UMSynchronizedSortedDictionary alloc]init];
    commandDef[@"command-name"] = @"Update-Location-Request";
    commandDef[@"web-name"] = @"update-location-request";
    commandDef[@"command-number"] = @(316);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

