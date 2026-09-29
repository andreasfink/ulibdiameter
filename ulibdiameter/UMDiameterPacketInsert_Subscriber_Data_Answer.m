//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.m
//  ulibdiameter
//
//  Created by afink on 2021-03-23 23:12:20.410339
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import <ulibdiameter/UMDiameterPacketInsert_Subscriber_Data_Answer.h>
#import <ulibdiameter/UMDiameterAvpSession_Id.h>
#import <ulibdiameter/UMDiameterAvpDRMP.h>
#import <ulibdiameter/UMDiameterAvpVendor_Specific_Application_Id.h>
#import <ulibdiameter/UMDiameterAvpSupported_Features.h>
#import <ulibdiameter/UMDiameterAvpResult_Code.h>
#import <ulibdiameter/UMDiameterAvpExperimental_Result.h>
#import <ulibdiameter/UMDiameterAvpAuth_Session_State.h>
#import <ulibdiameter/UMDiameterAvpOrigin_Host.h>
#import <ulibdiameter/UMDiameterAvpOrigin_Realm.h>
#import <ulibdiameter/UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.h>
#import <ulibdiameter/UMDiameterAvpLast_UE_Activity_Time.h>
#import <ulibdiameter/UMDiameterAvpRAT_Type.h>
#import <ulibdiameter/UMDiameterAvpIDA_Flags.h>
#import <ulibdiameter/UMDiameterAvpEPS_User_State.h>
#import <ulibdiameter/UMDiameterAvpEPS_Location_Information.h>
#import <ulibdiameter/UMDiameterAvpLocal_Time_Zone.h>
#import <ulibdiameter/UMDiameterAvpSupported_Services.h>
#import <ulibdiameter/UMDiameterAvpMonitoring_Event_Report.h>
#import <ulibdiameter/UMDiameterAvpMonitoring_Event_Config_Status.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>
#import <ulibdiameter/UMDiameterAvpFailed_AVP.h>
#import <ulibdiameter/UMDiameterAvpProxy_Info.h>
#import <ulibdiameter/UMDiameterAvpRoute_Record.h>

@implementation UMDiameterPacketInsert_Subscriber_Data_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 319;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = 16777251;
}

+ (uint32_t)commandCode
{
    return 319;
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
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_result_code)
    {
        [_var_result_code beforeEncode];
        [arr addObject:_var_result_code];
    }
    if(_var_experimental_result)
    {
        [_var_experimental_result beforeEncode];
        [arr addObject:_var_experimental_result];
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
    if(_var_ims_voice_over_ps_sessions_supported)
    {
        [_var_ims_voice_over_ps_sessions_supported beforeEncode];
        [arr addObject:_var_ims_voice_over_ps_sessions_supported];
    }
    if(_var_last_ue_activity_time)
    {
        [_var_last_ue_activity_time beforeEncode];
        [arr addObject:_var_last_ue_activity_time];
    }
    if(_var_rat_type)
    {
        [_var_rat_type beforeEncode];
        [arr addObject:_var_rat_type];
    }
    if(_var_ida_flags)
    {
        [_var_ida_flags beforeEncode];
        [arr addObject:_var_ida_flags];
    }
    if(_var_eps_user_state)
    {
        [_var_eps_user_state beforeEncode];
        [arr addObject:_var_eps_user_state];
    }
    if(_var_eps_location_information)
    {
        [_var_eps_location_information beforeEncode];
        [arr addObject:_var_eps_location_information];
    }
    if(_var_local_time_zone)
    {
        [_var_local_time_zone beforeEncode];
        [arr addObject:_var_local_time_zone];
    }
    if(_var_supported_services)
    {
        [_var_supported_services beforeEncode];
        [arr addObject:_var_supported_services];
    }
    if(_var_monitoring_event_report.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Report *o in _var_monitoring_event_report)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_monitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _var_monitoring_event_config_status)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_failed_avp)
    {
        [_var_failed_avp beforeEncode];
        [arr addObject:_var_failed_avp];
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
    if(dict[@"result-code"])
    {
        _var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        _var_result_code.objectValue = dict[@"result-code"];
    }

    if(dict[@"experimental-result"])
    {
        _var_experimental_result = [[UMDiameterAvpExperimental_Result alloc]init];
        _var_experimental_result.objectValue = dict[@"experimental-result"];
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

    if(dict[@"ims-voice-over-ps-sessions-supported"])
    {
        _var_ims_voice_over_ps_sessions_supported = [[UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported alloc]init];
        _var_ims_voice_over_ps_sessions_supported.objectValue = dict[@"ims-voice-over-ps-sessions-supported"];
    }

    if(dict[@"last-ue-activity-time"])
    {
        _var_last_ue_activity_time = [[UMDiameterAvpLast_UE_Activity_Time alloc]init];
        _var_last_ue_activity_time.objectValue = dict[@"last-ue-activity-time"];
    }

    if(dict[@"rat-type"])
    {
        _var_rat_type = [[UMDiameterAvpRAT_Type alloc]init];
        _var_rat_type.objectValue = dict[@"rat-type"];
    }

    if(dict[@"ida-flags"])
    {
        _var_ida_flags = [[UMDiameterAvpIDA_Flags alloc]init];
        _var_ida_flags.objectValue = dict[@"ida-flags"];
    }

    if(dict[@"eps-user-state"])
    {
        _var_eps_user_state = [[UMDiameterAvpEPS_User_State alloc]init];
        _var_eps_user_state.objectValue = dict[@"eps-user-state"];
    }

    if(dict[@"eps-location-information"])
    {
        _var_eps_location_information = [[UMDiameterAvpEPS_Location_Information alloc]init];
        _var_eps_location_information.objectValue = dict[@"eps-location-information"];
    }

    if(dict[@"local-time-zone"])
    {
        _var_local_time_zone = [[UMDiameterAvpLocal_Time_Zone alloc]init];
        _var_local_time_zone.objectValue = dict[@"local-time-zone"];
    }

    if(dict[@"supported-services"])
    {
        _var_supported_services = [[UMDiameterAvpSupported_Services alloc]init];
        _var_supported_services.objectValue = dict[@"supported-services"];
    }

    if(dict[@"monitoring-event-report"])
    {
        id obj = dict[@"monitoring-event-report"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpMonitoring_Event_Report *o = [[UMDiameterAvpMonitoring_Event_Report alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_monitoring_event_report = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpMonitoring_Event_Report *o = [[UMDiameterAvpMonitoring_Event_Report alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_monitoring_event_report = arr;
        }
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
    if(dict[@"failed-avp"])
    {
        _var_failed_avp = [[UMDiameterAvpFailed_AVP alloc]init];
        _var_failed_avp.objectValue = dict[@"failed-avp"];
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
    if(_var_supported_features)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_features)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-features"] = arr;
    }
    if(_var_result_code)
    {
        dict[@"result-code"] = _var_result_code.objectValue;
    }
    if(_var_experimental_result)
    {
        dict[@"experimental-result"] = _var_experimental_result.objectValue;
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
    if(_var_ims_voice_over_ps_sessions_supported)
    {
        dict[@"ims-voice-over-ps-sessions-supported"] = _var_ims_voice_over_ps_sessions_supported.objectValue;
    }
    if(_var_last_ue_activity_time)
    {
        dict[@"last-ue-activity-time"] = _var_last_ue_activity_time.objectValue;
    }
    if(_var_rat_type)
    {
        dict[@"rat-type"] = _var_rat_type.objectValue;
    }
    if(_var_ida_flags)
    {
        dict[@"ida-flags"] = _var_ida_flags.objectValue;
    }
    if(_var_eps_user_state)
    {
        dict[@"eps-user-state"] = _var_eps_user_state.objectValue;
    }
    if(_var_eps_location_information)
    {
        dict[@"eps-location-information"] = _var_eps_location_information.objectValue;
    }
    if(_var_local_time_zone)
    {
        dict[@"local-time-zone"] = _var_local_time_zone.objectValue;
    }
    if(_var_supported_services)
    {
        dict[@"supported-services"] = _var_supported_services.objectValue;
    }
    if(_var_monitoring_event_report)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_monitoring_event_report)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"monitoring-event-report"] = arr;
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
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
    }
    if(_var_failed_avp)
    {
        dict[@"failed-avp"] = _var_failed_avp.objectValue;
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

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"optional"];

    [UMDiameterAvpExperimental_Result appendWebDiameterParameters:s webName:@"experimental-result"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported appendWebDiameterParameters:s webName:@"ims-voice-over-ps-sessions-supported"  comment:@"" css:@"optional"];

    [UMDiameterAvpLast_UE_Activity_Time appendWebDiameterParameters:s webName:@"last-ue-activity-time"  comment:@"" css:@"optional"];

    [UMDiameterAvpRAT_Type appendWebDiameterParameters:s webName:@"rat-type"  comment:@"" css:@"optional"];

    [UMDiameterAvpIDA_Flags appendWebDiameterParameters:s webName:@"ida-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpEPS_User_State appendWebDiameterParameters:s webName:@"eps-user-state"  comment:@"" css:@"optional"];

    [UMDiameterAvpEPS_Location_Information appendWebDiameterParameters:s webName:@"eps-location-information"  comment:@"" css:@"optional"];

    [UMDiameterAvpLocal_Time_Zone appendWebDiameterParameters:s webName:@"local-time-zone"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Services appendWebDiameterParameters:s webName:@"supported-services"  comment:@"" css:@"optional"];

    [UMDiameterAvpMonitoring_Event_Report appendWebDiameterParameters:s webName:@"monitoring-event-report[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpMonitoring_Event_Config_Status appendWebDiameterParameters:s webName:@"monitoring-event-config-status[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpFailed_AVP appendWebDiameterParameters:s webName:@"failed-avp"  comment:@"" css:@"optional"];

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
        else if(avp.avpCode == [UMDiameterAvpResult_Code avpCode])
        {
            UMDiameterAvpResult_Code *avp2 = [[UMDiameterAvpResult_Code alloc]initWithAvp:avp];
            _var_result_code = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpExperimental_Result avpCode])
        {
            UMDiameterAvpExperimental_Result *avp2 = [[UMDiameterAvpExperimental_Result alloc]initWithAvp:avp];
            _var_experimental_result = avp2;
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
        else if(avp.avpCode == [UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported avpCode])
        {
            UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported *avp2 = [[UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported alloc]initWithAvp:avp];
            _var_ims_voice_over_ps_sessions_supported = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpLast_UE_Activity_Time avpCode])
        {
            UMDiameterAvpLast_UE_Activity_Time *avp2 = [[UMDiameterAvpLast_UE_Activity_Time alloc]initWithAvp:avp];
            _var_last_ue_activity_time = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpRAT_Type avpCode])
        {
            UMDiameterAvpRAT_Type *avp2 = [[UMDiameterAvpRAT_Type alloc]initWithAvp:avp];
            _var_rat_type = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpIDA_Flags avpCode])
        {
            UMDiameterAvpIDA_Flags *avp2 = [[UMDiameterAvpIDA_Flags alloc]initWithAvp:avp];
            _var_ida_flags = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_User_State avpCode])
        {
            UMDiameterAvpEPS_User_State *avp2 = [[UMDiameterAvpEPS_User_State alloc]initWithAvp:avp];
            _var_eps_user_state = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Location_Information avpCode])
        {
            UMDiameterAvpEPS_Location_Information *avp2 = [[UMDiameterAvpEPS_Location_Information alloc]initWithAvp:avp];
            _var_eps_location_information = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpLocal_Time_Zone avpCode])
        {
            UMDiameterAvpLocal_Time_Zone *avp2 = [[UMDiameterAvpLocal_Time_Zone alloc]initWithAvp:avp];
            _var_local_time_zone = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSupported_Services avpCode])
        {
            UMDiameterAvpSupported_Services *avp2 = [[UMDiameterAvpSupported_Services alloc]initWithAvp:avp];
            _var_supported_services = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Event_Report avpCode])
        {
            UMDiameterAvpMonitoring_Event_Report *avp2 = [[UMDiameterAvpMonitoring_Event_Report alloc]initWithAvp:avp];
            if(_var_monitoring_event_report == NULL)
            {
                _var_monitoring_event_report = (NSArray<UMDiameterAvpMonitoring_Event_Report *>*)@[avp2];
            }
            else
            {
                _var_monitoring_event_report = [_var_monitoring_event_report arrayByAddingObject:avp2];
            }
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
        else if(avp.avpCode == [UMDiameterAvpFailed_AVP avpCode])
        {
            UMDiameterAvpFailed_AVP *avp2 = [[UMDiameterAvpFailed_AVP alloc]initWithAvp:avp];
            _var_failed_avp = avp2;
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
    dict[@"Diameter-Version"] = @(_version);
    dict[@"Diameter-Command-Code"] = @(_commandCode);
    dict[@"Diameter-Command-Flags"] = @(_commandFlags);
    dict[@"Diameter-Application-Id"] = @(_applicationId);
    dict[@"Hop-by-Hop-Identifier"] = @(_hopByHopIdentifier);
    dict[@"End-to-End-Identifier"] = @(_endToEndIdentifier);
	dict[@"Session-Id"] = [_var_session_id objectValue];
	dict[@"DRMP"] = [_var_drmp objectValue];
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
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
	dict[@"Result-Code"] = [_var_result_code objectValue];
	dict[@"Experimental-Result"] = [_var_experimental_result objectValue];
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"IMS-Voice-Over-PS-Sessions-Supported"] = [_var_ims_voice_over_ps_sessions_supported objectValue];
	dict[@"Last-UE-Activity-Time"] = [_var_last_ue_activity_time objectValue];
	dict[@"RAT-Type"] = [_var_rat_type objectValue];
	dict[@"IDA-Flags"] = [_var_ida_flags objectValue];
	dict[@"EPS-User-State"] = [_var_eps_user_state objectValue];
	dict[@"EPS-Location-Information"] = [_var_eps_location_information objectValue];
	dict[@"Local-Time-Zone"] = [_var_local_time_zone objectValue];
	dict[@"Supported-Services"] = [_var_supported_services objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_monitoring_event_report.count>0)
		{
			for(UMDiameterAvp *avp in _var_monitoring_event_report)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Monitoring-Event-Report"] = arr;
		}
	}
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
	dict[@"Failed-AVP"] = [_var_failed_avp objectValue];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Features definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpResult_Code definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExperimental_Result definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLast_UE_Activity_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRAT_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIDA_Flags definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEPS_User_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEPS_Location_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLocal_Time_Zone definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Event_Report definition];
        def[@"multiple"]=@(YES);
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpFailed_AVP definition];
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
    commandDef[@"command-name"] = @"Insert-Subscriber-Data-Answer";
    commandDef[@"web-name"] = @"insert-subscriber-data-answer";
    commandDef[@"command-number"] = @(319);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(NO);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

