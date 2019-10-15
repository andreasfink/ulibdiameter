//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:10.322000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketInsert_Subscriber_Data_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.h"
#import "UMDiameterAvpLast_UE_Activity_Time.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpIDA_Flags.h"
#import "UMDiameterAvpEPS_User_State.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpLocal_Time_Zone.h"
#import "UMDiameterAvpSupported_Services.h"
#import "UMDiameterAvpMonitoring_Event_Report.h"
#import "UMDiameterAvpMonitoring_Event_Config_Status.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketInsert_Subscriber_Data_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 319;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
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
    for(UMDiameterAvp *avp in _packet_avps)
    {
        if([avp isKindOfClass:[UMDiameterAvpSession_Id class]])
        {
            _var_session_id = (UMDiameterAvpSession_Id *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpDRMP class]])
        {
            _var_drmp = (UMDiameterAvpDRMP *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpVendor_Specific_Application_Id class]])
        {
            _var_vendor_specific_application_id = (UMDiameterAvpVendor_Specific_Application_Id *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpSupported_Features class]])
        {
            if(_var_supported_features == NULL)
            {
                _var_supported_features = (NSArray<UMDiameterAvpSupported_Features *>*)@[avp];
            }
            else
            {
                _var_supported_features = [_var_supported_features arrayByAddingObject:(UMDiameterAvpSupported_Features *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpResult_Code class]])
        {
            _var_result_code = (UMDiameterAvpResult_Code *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpExperimental_Result class]])
        {
            _var_experimental_result = (UMDiameterAvpExperimental_Result *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpAuth_Session_State class]])
        {
            _var_auth_session_state = (UMDiameterAvpAuth_Session_State *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_Host class]])
        {
            _var_origin_host = (UMDiameterAvpOrigin_Host *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_Realm class]])
        {
            _var_origin_realm = (UMDiameterAvpOrigin_Realm *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported class]])
        {
            _var_ims_voice_over_ps_sessions_supported = (UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpLast_UE_Activity_Time class]])
        {
            _var_last_ue_activity_time = (UMDiameterAvpLast_UE_Activity_Time *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpRAT_Type class]])
        {
            _var_rat_type = (UMDiameterAvpRAT_Type *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpIDA_Flags class]])
        {
            _var_ida_flags = (UMDiameterAvpIDA_Flags *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpEPS_User_State class]])
        {
            _var_eps_user_state = (UMDiameterAvpEPS_User_State *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpEPS_Location_Information class]])
        {
            _var_eps_location_information = (UMDiameterAvpEPS_Location_Information *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpLocal_Time_Zone class]])
        {
            _var_local_time_zone = (UMDiameterAvpLocal_Time_Zone *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpSupported_Services class]])
        {
            _var_supported_services = (UMDiameterAvpSupported_Services *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpMonitoring_Event_Report class]])
        {
            if(_var_monitoring_event_report == NULL)
            {
                _var_monitoring_event_report = (NSArray<UMDiameterAvpMonitoring_Event_Report *>*)@[avp];
            }
            else
            {
                _var_monitoring_event_report = [_var_monitoring_event_report arrayByAddingObject:(UMDiameterAvpMonitoring_Event_Report *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpMonitoring_Event_Config_Status class]])
        {
            if(_var_monitoring_event_config_status == NULL)
            {
                _var_monitoring_event_config_status = (NSArray<UMDiameterAvpMonitoring_Event_Config_Status *>*)@[avp];
            }
            else
            {
                _var_monitoring_event_config_status = [_var_monitoring_event_config_status arrayByAddingObject:(UMDiameterAvpMonitoring_Event_Config_Status *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpFailed_AVP class]])
        {
            _var_failed_avp = (UMDiameterAvpFailed_AVP *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpProxy_Info class]])
        {
            if(_var_proxy_info == NULL)
            {
                _var_proxy_info = (NSArray<UMDiameterAvpProxy_Info *>*)@[avp];
            }
            else
            {
                _var_proxy_info = [_var_proxy_info arrayByAddingObject:(UMDiameterAvpProxy_Info *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpRoute_Record class]])
        {
            if(_var_route_record == NULL)
            {
                _var_route_record = (NSArray<UMDiameterAvpRoute_Record *>*)@[avp];
            }
            else
            {
                _var_route_record = [_var_route_record arrayByAddingObject:(UMDiameterAvpRoute_Record *)avp];
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

@end

