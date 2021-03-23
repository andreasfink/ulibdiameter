//
//  UMDiameterPacketNotify_Request.m
//  ulibdiameter
//
//  Created by afink on 2021-03-23 03:34:00.869421
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketNotify_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpAlert_Reason.h"
#import "UMDiameterAvpUE_SRVCC_Capability.h"
#import "UMDiameterAvpNOR_Flags.h"
#import "UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h"
#import "UMDiameterAvpMaximum_UE_Availability_Time.h"
#import "UMDiameterAvpMonitoring_Event_Config_Status.h"
#import "UMDiameterAvpEmergency_Services.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketNotify_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 323;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = 16777251;
}

+ (uint32_t)commandCode
{
    return 323;
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
    if(_var_vendor_specific_application_id)
    {
        [_var_vendor_specific_application_id beforeEncode];
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_drmp)
    {
        [_var_drmp beforeEncode];
        [arr addObject:_var_drmp];
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
    if(_var_mip6_agent_info)
    {
        [_var_mip6_agent_info beforeEncode];
        [arr addObject:_var_mip6_agent_info];
    }
    if(_var_visited_network_identifier)
    {
        [_var_visited_network_identifier beforeEncode];
        [arr addObject:_var_visited_network_identifier];
    }
    if(_var_context_identifier)
    {
        [_var_context_identifier beforeEncode];
        [arr addObject:_var_context_identifier];
    }
    if(_var_service_selection)
    {
        [_var_service_selection beforeEncode];
        [arr addObject:_var_service_selection];
    }
    if(_var_alert_reason)
    {
        [_var_alert_reason beforeEncode];
        [arr addObject:_var_alert_reason];
    }
    if(_var_ue_srvcc_capability)
    {
        [_var_ue_srvcc_capability beforeEncode];
        [arr addObject:_var_ue_srvcc_capability];
    }
    if(_var_nor_flags)
    {
        [_var_nor_flags beforeEncode];
        [arr addObject:_var_nor_flags];
    }
    if(_var_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [_var_homogeneous_support_of_ims_voice_over_ps_sessions beforeEncode];
        [arr addObject:_var_homogeneous_support_of_ims_voice_over_ps_sessions];
    }
    if(_var_maximum_ue_availability_time)
    {
        [_var_maximum_ue_availability_time beforeEncode];
        [arr addObject:_var_maximum_ue_availability_time];
    }
    if(_var_monitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _var_monitoring_event_config_status)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_emergency_services)
    {
        [_var_emergency_services beforeEncode];
        [arr addObject:_var_emergency_services];
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

    if(dict[@"vendor-specific-application-id"])
    {
        _var_vendor_specific_application_id = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
        _var_vendor_specific_application_id.objectValue = dict[@"vendor-specific-application-id"];
    }

    if(dict[@"drmp"])
    {
        _var_drmp = [[UMDiameterAvpDRMP alloc]init];
        _var_drmp.objectValue = dict[@"drmp"];
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

    if(dict[@"mip6-agent-info"])
    {
        _var_mip6_agent_info = [[UMDiameterAvpMIP6_Agent_Info alloc]init];
        _var_mip6_agent_info.objectValue = dict[@"mip6-agent-info"];
    }

    if(dict[@"visited-network-identifier"])
    {
        _var_visited_network_identifier = [[UMDiameterAvpVisited_Network_Identifier alloc]init];
        _var_visited_network_identifier.objectValue = dict[@"visited-network-identifier"];
    }

    if(dict[@"context-identifier"])
    {
        _var_context_identifier = [[UMDiameterAvpContext_Identifier alloc]init];
        _var_context_identifier.objectValue = dict[@"context-identifier"];
    }

    if(dict[@"service-selection"])
    {
        _var_service_selection = [[UMDiameterAvpService_Selection alloc]init];
        _var_service_selection.objectValue = dict[@"service-selection"];
    }

    if(dict[@"alert-reason"])
    {
        _var_alert_reason = [[UMDiameterAvpAlert_Reason alloc]init];
        _var_alert_reason.objectValue = dict[@"alert-reason"];
    }

    if(dict[@"ue-srvcc-capability"])
    {
        _var_ue_srvcc_capability = [[UMDiameterAvpUE_SRVCC_Capability alloc]init];
        _var_ue_srvcc_capability.objectValue = dict[@"ue-srvcc-capability"];
    }

    if(dict[@"nor-flags"])
    {
        _var_nor_flags = [[UMDiameterAvpNOR_Flags alloc]init];
        _var_nor_flags.objectValue = dict[@"nor-flags"];
    }

    if(dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"])
    {
        _var_homogeneous_support_of_ims_voice_over_ps_sessions = [[UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions alloc]init];
        _var_homogeneous_support_of_ims_voice_over_ps_sessions.objectValue = dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"];
    }

    if(dict[@"maximum-ue-availability-time"])
    {
        _var_maximum_ue_availability_time = [[UMDiameterAvpMaximum_UE_Availability_Time alloc]init];
        _var_maximum_ue_availability_time.objectValue = dict[@"maximum-ue-availability-time"];
    }

    if(dict[@"monitoring-event-config-status"])
    {
        id obj = dict[@"monitoring-event-config-status"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpMonitoring_Event_Config_Status *o = [[UMDiameterAvpMonitoring_Event_Config_Status alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_monitoring_event_config_status = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpMonitoring_Event_Config_Status *o = [[UMDiameterAvpMonitoring_Event_Config_Status alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_monitoring_event_config_status = arr;
        }
    }
    if(dict[@"emergency-services"])
    {
        _var_emergency_services = [[UMDiameterAvpEmergency_Services alloc]init];
        _var_emergency_services.objectValue = dict[@"emergency-services"];
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
    if(_var_vendor_specific_application_id)
    {
        dict[@"vendor-specific-application-id"] = _var_vendor_specific_application_id.objectValue;
    }
    if(_var_drmp)
    {
        dict[@"drmp"] = _var_drmp.objectValue;
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
    if(_var_mip6_agent_info)
    {
        dict[@"mip6-agent-info"] = _var_mip6_agent_info.objectValue;
    }
    if(_var_visited_network_identifier)
    {
        dict[@"visited-network-identifier"] = _var_visited_network_identifier.objectValue;
    }
    if(_var_context_identifier)
    {
        dict[@"context-identifier"] = _var_context_identifier.objectValue;
    }
    if(_var_service_selection)
    {
        dict[@"service-selection"] = _var_service_selection.objectValue;
    }
    if(_var_alert_reason)
    {
        dict[@"alert-reason"] = _var_alert_reason.objectValue;
    }
    if(_var_ue_srvcc_capability)
    {
        dict[@"ue-srvcc-capability"] = _var_ue_srvcc_capability.objectValue;
    }
    if(_var_nor_flags)
    {
        dict[@"nor-flags"] = _var_nor_flags.objectValue;
    }
    if(_var_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        dict[@"homogeneous-support-of-ims-voice-over-ps-sessions"] = _var_homogeneous_support_of_ims_voice_over_ps_sessions.objectValue;
    }
    if(_var_maximum_ue_availability_time)
    {
        dict[@"maximum-ue-availability-time"] = _var_maximum_ue_availability_time.objectValue;
    }
    if(_var_monitoring_event_config_status)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_monitoring_event_config_status)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"monitoring-event-config-status"] = arr;
    }
    if(_var_emergency_services)
    {
        dict[@"emergency-services"] = _var_emergency_services.objectValue;
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

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpDRMP appendWebDiameterParameters:s webName:@"drmp"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpTerminal_Information appendWebDiameterParameters:s webName:@"terminal-information"  comment:@"" css:@"optional"];

    [UMDiameterAvpMIP6_Agent_Info appendWebDiameterParameters:s webName:@"mip6-agent-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpVisited_Network_Identifier appendWebDiameterParameters:s webName:@"visited-network-identifier"  comment:@"" css:@"optional"];

    [UMDiameterAvpContext_Identifier appendWebDiameterParameters:s webName:@"context-identifier"  comment:@"" css:@"optional"];

    [UMDiameterAvpService_Selection appendWebDiameterParameters:s webName:@"service-selection"  comment:@"" css:@"optional"];

    [UMDiameterAvpAlert_Reason appendWebDiameterParameters:s webName:@"alert-reason"  comment:@"" css:@"optional"];

    [UMDiameterAvpUE_SRVCC_Capability appendWebDiameterParameters:s webName:@"ue-srvcc-capability"  comment:@"" css:@"optional"];

    [UMDiameterAvpNOR_Flags appendWebDiameterParameters:s webName:@"nor-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions appendWebDiameterParameters:s webName:@"homogeneous-support-of-ims-voice-over-ps-sessions"  comment:@"" css:@"optional"];

    [UMDiameterAvpMaximum_UE_Availability_Time appendWebDiameterParameters:s webName:@"maximum-ue-availability-time"  comment:@"" css:@"optional"];

    [UMDiameterAvpMonitoring_Event_Config_Status appendWebDiameterParameters:s webName:@"monitoring-event-config-status[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpEmergency_Services appendWebDiameterParameters:s webName:@"emergency-services"  comment:@"" css:@"optional"];

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
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            _var_vendor_specific_application_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDRMP avpCode])
        {
            UMDiameterAvpDRMP *avp2 = [[UMDiameterAvpDRMP alloc]initWithAvp:avp];
            _var_drmp = avp2;
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
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            UMDiameterAvpMIP6_Agent_Info *avp2 = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            _var_mip6_agent_info = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            UMDiameterAvpVisited_Network_Identifier *avp2 = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            _var_visited_network_identifier = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpContext_Identifier avpCode])
        {
            UMDiameterAvpContext_Identifier *avp2 = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _var_context_identifier = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            UMDiameterAvpService_Selection *avp2 = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _var_service_selection = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAlert_Reason avpCode])
        {
            UMDiameterAvpAlert_Reason *avp2 = [[UMDiameterAvpAlert_Reason alloc]initWithAvp:avp];
            _var_alert_reason = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpUE_SRVCC_Capability avpCode])
        {
            UMDiameterAvpUE_SRVCC_Capability *avp2 = [[UMDiameterAvpUE_SRVCC_Capability alloc]initWithAvp:avp];
            _var_ue_srvcc_capability = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpNOR_Flags avpCode])
        {
            UMDiameterAvpNOR_Flags *avp2 = [[UMDiameterAvpNOR_Flags alloc]initWithAvp:avp];
            _var_nor_flags = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions avpCode])
        {
            UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions *avp2 = [[UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions alloc]initWithAvp:avp];
            _var_homogeneous_support_of_ims_voice_over_ps_sessions = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpMaximum_UE_Availability_Time avpCode])
        {
            UMDiameterAvpMaximum_UE_Availability_Time *avp2 = [[UMDiameterAvpMaximum_UE_Availability_Time alloc]initWithAvp:avp];
            _var_maximum_ue_availability_time = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Event_Config_Status avpCode])
        {
            UMDiameterAvpMonitoring_Event_Config_Status *avp2 = [[UMDiameterAvpMonitoring_Event_Config_Status alloc]initWithAvp:avp];
            if(_var_monitoring_event_config_status == NULL)
            {
                _var_monitoring_event_config_status = (NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>*)@[avp2];
            }
            else
            {
                _var_monitoring_event_config_status = [_var_monitoring_event_config_status arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpEmergency_Services avpCode])
        {
            UMDiameterAvpEmergency_Services *avp2 = [[UMDiameterAvpEmergency_Services alloc]initWithAvp:avp];
            _var_emergency_services = avp2;
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
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"DRMP"] = [_var_drmp objectValue];
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
	dict[@"MIP6-Agent-Info"] = [_var_mip6_agent_info objectValue];
	dict[@"Visited-Network-Identifier"] = [_var_visited_network_identifier objectValue];
	dict[@"Context-Identifier"] = [_var_context_identifier objectValue];
	dict[@"Service-Selection"] = [_var_service_selection objectValue];
	dict[@"Alert-Reason"] = [_var_alert_reason objectValue];
	dict[@"UE-SRVCC-Capability"] = [_var_ue_srvcc_capability objectValue];
	dict[@"NOR-Flags"] = [_var_nor_flags objectValue];
	dict[@"Homogeneous-Support-of-IMS-Voice-Over-PS-Sessions"] = [_var_homogeneous_support_of_ims_voice_over_ps_sessions objectValue];
	dict[@"Maximum-UE-Availability-Time"] = [_var_maximum_ue_availability_time objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_monitoring_event_config_status.count>0)
		{
			for(UMDiameterAvp *avp in _var_monitoring_event_config_status)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Monitoring-Event-Config-Status"] = arr;
		}
	}
	dict[@"Emergency-Services"] = [_var_emergency_services objectValue];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Specific_Application_Id definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMIP6_Agent_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_Network_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpContext_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Selection definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAlert_Reason definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUE_SRVCC_Capability definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpNOR_Flags definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMaximum_UE_Availability_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Event_Config_Status definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEmergency_Services definition];
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
    commandDef[@"command-name"] = @"Notify-Request";
    commandDef[@"web-name"] = @"notify-request";
    commandDef[@"command-number"] = @(323);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

