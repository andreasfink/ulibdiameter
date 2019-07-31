//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:14:09.498000
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
        [arr addObject:_var_session_id];
    }
    if(_var_drmp)
    {
        [arr addObject:_var_drmp];
    }
    if(_var_vendor_specific_application_id)
    {
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [arr addObject:o];
        }
    }
    if(_var_result_code)
    {
        [arr addObject:_var_result_code];
    }
    if(_var_experimental_result)
    {
        [arr addObject:_var_experimental_result];
    }
    if(_var_auth_session_state)
    {
        [arr addObject:_var_auth_session_state];
    }
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_ims_voice_over_ps_sessions_supported)
    {
        [arr addObject:_var_ims_voice_over_ps_sessions_supported];
    }
    if(_var_last_ue_activity_time)
    {
        [arr addObject:_var_last_ue_activity_time];
    }
    if(_var_rat_type)
    {
        [arr addObject:_var_rat_type];
    }
    if(_var_ida_flags)
    {
        [arr addObject:_var_ida_flags];
    }
    if(_var_eps_user_state)
    {
        [arr addObject:_var_eps_user_state];
    }
    if(_var_eps_location_information)
    {
        [arr addObject:_var_eps_location_information];
    }
    if(_var_local_time_zone)
    {
        [arr addObject:_var_local_time_zone];
    }
    if(_var_supported_services)
    {
        [arr addObject:_var_supported_services];
    }
    if(_var_monitoring_event_report.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Report *o in _var_monitoring_event_report)
        {
            [arr addObject:o];
        }
    }
    if(_var_monitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _var_monitoring_event_config_status)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    if(_var_failed_avp)
    {
        [arr addObject:_var_failed_avp];
    }
    if(_var_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _var_proxy_info)
        {
            [arr addObject:o];
        }
    }
    if(_var_route_record.count > 0)
    {
        for(UMDiameterAvpRoute_Record *o in _var_route_record)
        {
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


    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpDRMP appendWebDiameterParameters:s webName:@"drmp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpExperimental_Result appendWebDiameterParameters:s webName:@"experimental-result"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported appendWebDiameterParameters:s webName:@"ims-voice-over-ps-sessions-supported"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLast_UE_Activity_Time appendWebDiameterParameters:s webName:@"last-ue-activity-time"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpRAT_Type appendWebDiameterParameters:s webName:@"rat-type"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpIDA_Flags appendWebDiameterParameters:s webName:@"ida-flags"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpEPS_User_State appendWebDiameterParameters:s webName:@"eps-user-state"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpEPS_Location_Information appendWebDiameterParameters:s webName:@"eps-location-information"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLocal_Time_Zone appendWebDiameterParameters:s webName:@"local-time-zone"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSupported_Services appendWebDiameterParameters:s webName:@"supported-services"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpMonitoring_Event_Report appendWebDiameterParameters:s webName:@"monitoring-event-report"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpMonitoring_Event_Config_Status appendWebDiameterParameters:s webName:@"monitoring-event-config-status"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAVP appendWebDiameterParameters:s webName:@"avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpFailed_AVP appendWebDiameterParameters:s webName:@"failed-avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

}

@end

