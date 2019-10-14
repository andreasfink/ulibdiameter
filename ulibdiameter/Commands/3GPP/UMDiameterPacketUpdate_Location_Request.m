//
//  UMDiameterPacketUpdate_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 08:53:34.984000
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
		for(UMDiameterAvp *avp in _var_supported_features)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Supported-Features"] = arr;
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
		for(UMDiameterAvp *avp in _var_active_apn)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Active-APN"] = arr;
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
		for(UMDiameterAvp *avp in _var_proxy_info)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Proxy-Info"] = arr;
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		for(UMDiameterAvp *avp in _var_route_record)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Route-Record"] = arr;
	}
	return dict;
}

@end

