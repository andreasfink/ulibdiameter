//
//  UMDiameterPacketProvide_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:15:40.079000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketProvide_Location_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpSLg_Location_Type.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpMSISDN.h"
#import "UMDiameterAvpIMEI.h"
#import "UMDiameterAvpLCS_EPS_Client_Name.h"
#import "UMDiameterAvpLCS_Client_Type.h"
#import "UMDiameterAvpLCS_Requestor_Name.h"
#import "UMDiameterAvpLCS_Priority.h"
#import "UMDiameterAvpLCS_QoS.h"
#import "UMDiameterAvpVelocity_Requested.h"
#import "UMDiameterAvpLCS_Supported_GAD_Shapes.h"
#import "UMDiameterAvpLCS_Service_Type_ID.h"
#import "UMDiameterAvpLCS_Codeword.h"
#import "UMDiameterAvpLCS_Privacy_Check_Non_Session.h"
#import "UMDiameterAvpLCS_Privacy_Check_Session.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpDeferred_Location_Type.h"
#import "UMDiameterAvpPLR_Flags.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketProvide_Location_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 8388620;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 8388620;
}

+ (uint32_t)defaultApplicationId
{
    return 16777255;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_session_id)
    {
        [arr addObject:_var_session_id];
    }
    if(_var_vendor_specific_application_id)
    {
        [arr addObject:_var_vendor_specific_application_id];
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
    if(_var_destination_host)
    {
        [arr addObject:_var_destination_host];
    }
    if(_var_destination_realm)
    {
        [arr addObject:_var_destination_realm];
    }
    if(_var_slg_location_type)
    {
        [arr addObject:_var_slg_location_type];
    }
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_msisdn)
    {
        [arr addObject:_var_msisdn];
    }
    if(_var_imei)
    {
        [arr addObject:_var_imei];
    }
    if(_var_lcs_eps_client_name)
    {
        [arr addObject:_var_lcs_eps_client_name];
    }
    if(_var_lcs_client_type)
    {
        [arr addObject:_var_lcs_client_type];
    }
    if(_var_lcs_requestor_name)
    {
        [arr addObject:_var_lcs_requestor_name];
    }
    if(_var_lcs_priority)
    {
        [arr addObject:_var_lcs_priority];
    }
    if(_var_lcs_qos)
    {
        [arr addObject:_var_lcs_qos];
    }
    if(_var_velocity_requested)
    {
        [arr addObject:_var_velocity_requested];
    }
    if(_var_lcs_supported_gad_shapes)
    {
        [arr addObject:_var_lcs_supported_gad_shapes];
    }
    if(_var_lcs_service_type_id)
    {
        [arr addObject:_var_lcs_service_type_id];
    }
    if(_var_lcs_codeword)
    {
        [arr addObject:_var_lcs_codeword];
    }
    if(_var_lcs_privacy_check_non_session)
    {
        [arr addObject:_var_lcs_privacy_check_non_session];
    }
    if(_var_lcs_privacy_check_session)
    {
        [arr addObject:_var_lcs_privacy_check_session];
    }
    if(_var_service_selection)
    {
        [arr addObject:_var_service_selection];
    }
    if(_var_deferred_location_type)
    {
        [arr addObject:_var_deferred_location_type];
    }
    if(_var_plr_flags)
    {
        [arr addObject:_var_plr_flags];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
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

    if(dict[@"slg-location-type"])
    {
        _var_slg_location_type = [[UMDiameterAvpSLg_Location_Type alloc]init];
        _var_slg_location_type.objectValue = dict[@"slg-location-type"];
    }

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"msisdn"])
    {
        _var_msisdn = [[UMDiameterAvpMSISDN alloc]init];
        _var_msisdn.objectValue = dict[@"msisdn"];
    }

    if(dict[@"imei"])
    {
        _var_imei = [[UMDiameterAvpIMEI alloc]init];
        _var_imei.objectValue = dict[@"imei"];
    }

    if(dict[@"lcs-eps-client-name"])
    {
        _var_lcs_eps_client_name = [[UMDiameterAvpLCS_EPS_Client_Name alloc]init];
        _var_lcs_eps_client_name.objectValue = dict[@"lcs-eps-client-name"];
    }

    if(dict[@"lcs-client-type"])
    {
        _var_lcs_client_type = [[UMDiameterAvpLCS_Client_Type alloc]init];
        _var_lcs_client_type.objectValue = dict[@"lcs-client-type"];
    }

    if(dict[@"lcs-requestor-name"])
    {
        _var_lcs_requestor_name = [[UMDiameterAvpLCS_Requestor_Name alloc]init];
        _var_lcs_requestor_name.objectValue = dict[@"lcs-requestor-name"];
    }

    if(dict[@"lcs-priority"])
    {
        _var_lcs_priority = [[UMDiameterAvpLCS_Priority alloc]init];
        _var_lcs_priority.objectValue = dict[@"lcs-priority"];
    }

    if(dict[@"lcs-qos"])
    {
        _var_lcs_qos = [[UMDiameterAvpLCS_QoS alloc]init];
        _var_lcs_qos.objectValue = dict[@"lcs-qos"];
    }

    if(dict[@"velocity-requested"])
    {
        _var_velocity_requested = [[UMDiameterAvpVelocity_Requested alloc]init];
        _var_velocity_requested.objectValue = dict[@"velocity-requested"];
    }

    if(dict[@"lcs-supported-gad-shapes"])
    {
        _var_lcs_supported_gad_shapes = [[UMDiameterAvpLCS_Supported_GAD_Shapes alloc]init];
        _var_lcs_supported_gad_shapes.objectValue = dict[@"lcs-supported-gad-shapes"];
    }

    if(dict[@"lcs-service-type-id"])
    {
        _var_lcs_service_type_id = [[UMDiameterAvpLCS_Service_Type_ID alloc]init];
        _var_lcs_service_type_id.objectValue = dict[@"lcs-service-type-id"];
    }

    if(dict[@"lcs-codeword"])
    {
        _var_lcs_codeword = [[UMDiameterAvpLCS_Codeword alloc]init];
        _var_lcs_codeword.objectValue = dict[@"lcs-codeword"];
    }

    if(dict[@"lcs-privacy-check-non-session"])
    {
        _var_lcs_privacy_check_non_session = [[UMDiameterAvpLCS_Privacy_Check_Non_Session alloc]init];
        _var_lcs_privacy_check_non_session.objectValue = dict[@"lcs-privacy-check-non-session"];
    }

    if(dict[@"lcs-privacy-check-session"])
    {
        _var_lcs_privacy_check_session = [[UMDiameterAvpLCS_Privacy_Check_Session alloc]init];
        _var_lcs_privacy_check_session.objectValue = dict[@"lcs-privacy-check-session"];
    }

    if(dict[@"service-selection"])
    {
        _var_service_selection = [[UMDiameterAvpService_Selection alloc]init];
        _var_service_selection.objectValue = dict[@"service-selection"];
    }

    if(dict[@"deferred-location-type"])
    {
        _var_deferred_location_type = [[UMDiameterAvpDeferred_Location_Type alloc]init];
        _var_deferred_location_type.objectValue = dict[@"deferred-location-type"];
    }

    if(dict[@"plr-flags"])
    {
        _var_plr_flags = [[UMDiameterAvpPLR_Flags alloc]init];
        _var_plr_flags.objectValue = dict[@"plr-flags"];
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
    if(_var_slg_location_type)
    {
        dict[@"slg-location-type"] = _var_slg_location_type.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_msisdn)
    {
        dict[@"msisdn"] = _var_msisdn.objectValue;
    }
    if(_var_imei)
    {
        dict[@"imei"] = _var_imei.objectValue;
    }
    if(_var_lcs_eps_client_name)
    {
        dict[@"lcs-eps-client-name"] = _var_lcs_eps_client_name.objectValue;
    }
    if(_var_lcs_client_type)
    {
        dict[@"lcs-client-type"] = _var_lcs_client_type.objectValue;
    }
    if(_var_lcs_requestor_name)
    {
        dict[@"lcs-requestor-name"] = _var_lcs_requestor_name.objectValue;
    }
    if(_var_lcs_priority)
    {
        dict[@"lcs-priority"] = _var_lcs_priority.objectValue;
    }
    if(_var_lcs_qos)
    {
        dict[@"lcs-qos"] = _var_lcs_qos.objectValue;
    }
    if(_var_velocity_requested)
    {
        dict[@"velocity-requested"] = _var_velocity_requested.objectValue;
    }
    if(_var_lcs_supported_gad_shapes)
    {
        dict[@"lcs-supported-gad-shapes"] = _var_lcs_supported_gad_shapes.objectValue;
    }
    if(_var_lcs_service_type_id)
    {
        dict[@"lcs-service-type-id"] = _var_lcs_service_type_id.objectValue;
    }
    if(_var_lcs_codeword)
    {
        dict[@"lcs-codeword"] = _var_lcs_codeword.objectValue;
    }
    if(_var_lcs_privacy_check_non_session)
    {
        dict[@"lcs-privacy-check-non-session"] = _var_lcs_privacy_check_non_session.objectValue;
    }
    if(_var_lcs_privacy_check_session)
    {
        dict[@"lcs-privacy-check-session"] = _var_lcs_privacy_check_session.objectValue;
    }
    if(_var_service_selection)
    {
        dict[@"service-selection"] = _var_service_selection.objectValue;
    }
    if(_var_deferred_location_type)
    {
        dict[@"deferred-location-type"] = _var_deferred_location_type.objectValue;
    }
    if(_var_plr_flags)
    {
        dict[@"plr-flags"] = _var_plr_flags.objectValue;
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


    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];
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
    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSLg_Location_Type appendWebDiameterParameters:s webName:@"slg-location-type"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpMSISDN appendWebDiameterParameters:s webName:@"msisdn"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpIMEI appendWebDiameterParameters:s webName:@"imei"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_EPS_Client_Name appendWebDiameterParameters:s webName:@"lcs-eps-client-name"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Client_Type appendWebDiameterParameters:s webName:@"lcs-client-type"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Requestor_Name appendWebDiameterParameters:s webName:@"lcs-requestor-name"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Priority appendWebDiameterParameters:s webName:@"lcs-priority"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_QoS appendWebDiameterParameters:s webName:@"lcs-qos"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpVelocity_Requested appendWebDiameterParameters:s webName:@"velocity-requested"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Supported_GAD_Shapes appendWebDiameterParameters:s webName:@"lcs-supported-gad-shapes"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Service_Type_ID appendWebDiameterParameters:s webName:@"lcs-service-type-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Codeword appendWebDiameterParameters:s webName:@"lcs-codeword"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Privacy_Check_Non_Session appendWebDiameterParameters:s webName:@"lcs-privacy-check-non-session"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Privacy_Check_Session appendWebDiameterParameters:s webName:@"lcs-privacy-check-session"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpService_Selection appendWebDiameterParameters:s webName:@"service-selection"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpDeferred_Location_Type appendWebDiameterParameters:s webName:@"deferred-location-type"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpPLR_Flags appendWebDiameterParameters:s webName:@"plr-flags"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAVP appendWebDiameterParameters:s webName:@"avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

}

@end

