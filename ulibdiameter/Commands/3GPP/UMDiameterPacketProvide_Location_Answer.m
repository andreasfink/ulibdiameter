//
//  UMDiameterPacketProvide_Location_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:10.511000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketProvide_Location_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpLocation_Estimate.h"
#import "UMDiameterAvpAccuracy_Fulfilment_Indicator.h"
#import "UMDiameterAvpAge_Of_Location_Estimate.h"
#import "UMDiameterAvpVelocity_Estimate.h"
#import "UMDiameterAvpEUTRAN_Positioning_Data.h"
#import "UMDiameterAvpECGI.h"
#import "UMDiameterAvpGERAN_Positioning_Info.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpUTRAN_Positioning_Info.h"
#import "UMDiameterAvpService_Area_Identity.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpPLA_Flags.h"
#import "UMDiameterAvpESMLC_Cell_Info.h"
#import "UMDiameterAvpCivic_Address.h"
#import "UMDiameterAvpBarometric_Pressure.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketProvide_Location_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 8388620;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
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
        [_var_session_id beforeEncode];
        [arr addObject:_var_session_id];
    }
    if(_var_vendor_specific_application_id)
    {
        [_var_vendor_specific_application_id beforeEncode];
        [arr addObject:_var_vendor_specific_application_id];
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
    if(_var_location_estimate)
    {
        [_var_location_estimate beforeEncode];
        [arr addObject:_var_location_estimate];
    }
    if(_var_accuracy_fulfilment_indicator)
    {
        [_var_accuracy_fulfilment_indicator beforeEncode];
        [arr addObject:_var_accuracy_fulfilment_indicator];
    }
    if(_var_age_of_location_estimate)
    {
        [_var_age_of_location_estimate beforeEncode];
        [arr addObject:_var_age_of_location_estimate];
    }
    if(_var_velocity_estimate)
    {
        [_var_velocity_estimate beforeEncode];
        [arr addObject:_var_velocity_estimate];
    }
    if(_var_eutran_positioning_data)
    {
        [_var_eutran_positioning_data beforeEncode];
        [arr addObject:_var_eutran_positioning_data];
    }
    if(_var_ecgi)
    {
        [_var_ecgi beforeEncode];
        [arr addObject:_var_ecgi];
    }
    if(_var_geran_positioning_info)
    {
        [_var_geran_positioning_info beforeEncode];
        [arr addObject:_var_geran_positioning_info];
    }
    if(_var_cell_global_identity)
    {
        [_var_cell_global_identity beforeEncode];
        [arr addObject:_var_cell_global_identity];
    }
    if(_var_utran_positioning_info)
    {
        [_var_utran_positioning_info beforeEncode];
        [arr addObject:_var_utran_positioning_info];
    }
    if(_var_service_area_identity)
    {
        [_var_service_area_identity beforeEncode];
        [arr addObject:_var_service_area_identity];
    }
    if(_var_serving_node)
    {
        [_var_serving_node beforeEncode];
        [arr addObject:_var_serving_node];
    }
    if(_var_pla_flags)
    {
        [_var_pla_flags beforeEncode];
        [arr addObject:_var_pla_flags];
    }
    if(_var_esmlc_cell_info)
    {
        [_var_esmlc_cell_info beforeEncode];
        [arr addObject:_var_esmlc_cell_info];
    }
    if(_var_civic_address)
    {
        [_var_civic_address beforeEncode];
        [arr addObject:_var_civic_address];
    }
    if(_var_barometric_pressure)
    {
        [_var_barometric_pressure beforeEncode];
        [arr addObject:_var_barometric_pressure];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
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

    if(dict[@"vendor-specific-application-id"])
    {
        _var_vendor_specific_application_id = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
        _var_vendor_specific_application_id.objectValue = dict[@"vendor-specific-application-id"];
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

    if(dict[@"location-estimate"])
    {
        _var_location_estimate = [[UMDiameterAvpLocation_Estimate alloc]init];
        _var_location_estimate.objectValue = dict[@"location-estimate"];
    }

    if(dict[@"accuracy-fulfilment-indicator"])
    {
        _var_accuracy_fulfilment_indicator = [[UMDiameterAvpAccuracy_Fulfilment_Indicator alloc]init];
        _var_accuracy_fulfilment_indicator.objectValue = dict[@"accuracy-fulfilment-indicator"];
    }

    if(dict[@"age-of-location-estimate"])
    {
        _var_age_of_location_estimate = [[UMDiameterAvpAge_Of_Location_Estimate alloc]init];
        _var_age_of_location_estimate.objectValue = dict[@"age-of-location-estimate"];
    }

    if(dict[@"velocity-estimate"])
    {
        _var_velocity_estimate = [[UMDiameterAvpVelocity_Estimate alloc]init];
        _var_velocity_estimate.objectValue = dict[@"velocity-estimate"];
    }

    if(dict[@"eutran-positioning-data"])
    {
        _var_eutran_positioning_data = [[UMDiameterAvpEUTRAN_Positioning_Data alloc]init];
        _var_eutran_positioning_data.objectValue = dict[@"eutran-positioning-data"];
    }

    if(dict[@"ecgi"])
    {
        _var_ecgi = [[UMDiameterAvpECGI alloc]init];
        _var_ecgi.objectValue = dict[@"ecgi"];
    }

    if(dict[@"geran-positioning-info"])
    {
        _var_geran_positioning_info = [[UMDiameterAvpGERAN_Positioning_Info alloc]init];
        _var_geran_positioning_info.objectValue = dict[@"geran-positioning-info"];
    }

    if(dict[@"cell-global-identity"])
    {
        _var_cell_global_identity = [[UMDiameterAvpCell_Global_Identity alloc]init];
        _var_cell_global_identity.objectValue = dict[@"cell-global-identity"];
    }

    if(dict[@"utran-positioning-info"])
    {
        _var_utran_positioning_info = [[UMDiameterAvpUTRAN_Positioning_Info alloc]init];
        _var_utran_positioning_info.objectValue = dict[@"utran-positioning-info"];
    }

    if(dict[@"service-area-identity"])
    {
        _var_service_area_identity = [[UMDiameterAvpService_Area_Identity alloc]init];
        _var_service_area_identity.objectValue = dict[@"service-area-identity"];
    }

    if(dict[@"serving-node"])
    {
        _var_serving_node = [[UMDiameterAvpServing_Node alloc]init];
        _var_serving_node.objectValue = dict[@"serving-node"];
    }

    if(dict[@"pla-flags"])
    {
        _var_pla_flags = [[UMDiameterAvpPLA_Flags alloc]init];
        _var_pla_flags.objectValue = dict[@"pla-flags"];
    }

    if(dict[@"esmlc-cell-info"])
    {
        _var_esmlc_cell_info = [[UMDiameterAvpESMLC_Cell_Info alloc]init];
        _var_esmlc_cell_info.objectValue = dict[@"esmlc-cell-info"];
    }

    if(dict[@"civic-address"])
    {
        _var_civic_address = [[UMDiameterAvpCivic_Address alloc]init];
        _var_civic_address.objectValue = dict[@"civic-address"];
    }

    if(dict[@"barometric-pressure"])
    {
        _var_barometric_pressure = [[UMDiameterAvpBarometric_Pressure alloc]init];
        _var_barometric_pressure.objectValue = dict[@"barometric-pressure"];
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
    if(_var_vendor_specific_application_id)
    {
        dict[@"vendor-specific-application-id"] = _var_vendor_specific_application_id.objectValue;
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
    if(_var_location_estimate)
    {
        dict[@"location-estimate"] = _var_location_estimate.objectValue;
    }
    if(_var_accuracy_fulfilment_indicator)
    {
        dict[@"accuracy-fulfilment-indicator"] = _var_accuracy_fulfilment_indicator.objectValue;
    }
    if(_var_age_of_location_estimate)
    {
        dict[@"age-of-location-estimate"] = _var_age_of_location_estimate.objectValue;
    }
    if(_var_velocity_estimate)
    {
        dict[@"velocity-estimate"] = _var_velocity_estimate.objectValue;
    }
    if(_var_eutran_positioning_data)
    {
        dict[@"eutran-positioning-data"] = _var_eutran_positioning_data.objectValue;
    }
    if(_var_ecgi)
    {
        dict[@"ecgi"] = _var_ecgi.objectValue;
    }
    if(_var_geran_positioning_info)
    {
        dict[@"geran-positioning-info"] = _var_geran_positioning_info.objectValue;
    }
    if(_var_cell_global_identity)
    {
        dict[@"cell-global-identity"] = _var_cell_global_identity.objectValue;
    }
    if(_var_utran_positioning_info)
    {
        dict[@"utran-positioning-info"] = _var_utran_positioning_info.objectValue;
    }
    if(_var_service_area_identity)
    {
        dict[@"service-area-identity"] = _var_service_area_identity.objectValue;
    }
    if(_var_serving_node)
    {
        dict[@"serving-node"] = _var_serving_node.objectValue;
    }
    if(_var_pla_flags)
    {
        dict[@"pla-flags"] = _var_pla_flags.objectValue;
    }
    if(_var_esmlc_cell_info)
    {
        dict[@"esmlc-cell-info"] = _var_esmlc_cell_info.objectValue;
    }
    if(_var_civic_address)
    {
        dict[@"civic-address"] = _var_civic_address.objectValue;
    }
    if(_var_barometric_pressure)
    {
        dict[@"barometric-pressure"] = _var_barometric_pressure.objectValue;
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

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"optional"];

    [UMDiameterAvpExperimental_Result appendWebDiameterParameters:s webName:@"experimental-result"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpLocation_Estimate appendWebDiameterParameters:s webName:@"location-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpAccuracy_Fulfilment_Indicator appendWebDiameterParameters:s webName:@"accuracy-fulfilment-indicator"  comment:@"" css:@"optional"];

    [UMDiameterAvpAge_Of_Location_Estimate appendWebDiameterParameters:s webName:@"age-of-location-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpVelocity_Estimate appendWebDiameterParameters:s webName:@"velocity-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpEUTRAN_Positioning_Data appendWebDiameterParameters:s webName:@"eutran-positioning-data"  comment:@"" css:@"optional"];

    [UMDiameterAvpECGI appendWebDiameterParameters:s webName:@"ecgi"  comment:@"" css:@"optional"];

    [UMDiameterAvpGERAN_Positioning_Info appendWebDiameterParameters:s webName:@"geran-positioning-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpCell_Global_Identity appendWebDiameterParameters:s webName:@"cell-global-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpUTRAN_Positioning_Info appendWebDiameterParameters:s webName:@"utran-positioning-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpService_Area_Identity appendWebDiameterParameters:s webName:@"service-area-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpServing_Node appendWebDiameterParameters:s webName:@"serving-node"  comment:@"" css:@"optional"];

    [UMDiameterAvpPLA_Flags appendWebDiameterParameters:s webName:@"pla-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpESMLC_Cell_Info appendWebDiameterParameters:s webName:@"esmlc-cell-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpCivic_Address appendWebDiameterParameters:s webName:@"civic-address"  comment:@"" css:@"optional"];

    [UMDiameterAvpBarometric_Pressure appendWebDiameterParameters:s webName:@"barometric-pressure"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

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
        else if([avp isKindOfClass:[UMDiameterAvpVendor_Specific_Application_Id class]])
        {
            _var_vendor_specific_application_id = (UMDiameterAvpVendor_Specific_Application_Id *)avp;
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
        else if([avp isKindOfClass:[UMDiameterAvpLocation_Estimate class]])
        {
            _var_location_estimate = (UMDiameterAvpLocation_Estimate *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpAccuracy_Fulfilment_Indicator class]])
        {
            _var_accuracy_fulfilment_indicator = (UMDiameterAvpAccuracy_Fulfilment_Indicator *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpAge_Of_Location_Estimate class]])
        {
            _var_age_of_location_estimate = (UMDiameterAvpAge_Of_Location_Estimate *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpVelocity_Estimate class]])
        {
            _var_velocity_estimate = (UMDiameterAvpVelocity_Estimate *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpEUTRAN_Positioning_Data class]])
        {
            _var_eutran_positioning_data = (UMDiameterAvpEUTRAN_Positioning_Data *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpECGI class]])
        {
            _var_ecgi = (UMDiameterAvpECGI *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpGERAN_Positioning_Info class]])
        {
            _var_geran_positioning_info = (UMDiameterAvpGERAN_Positioning_Info *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpCell_Global_Identity class]])
        {
            _var_cell_global_identity = (UMDiameterAvpCell_Global_Identity *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpUTRAN_Positioning_Info class]])
        {
            _var_utran_positioning_info = (UMDiameterAvpUTRAN_Positioning_Info *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpService_Area_Identity class]])
        {
            _var_service_area_identity = (UMDiameterAvpService_Area_Identity *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpServing_Node class]])
        {
            _var_serving_node = (UMDiameterAvpServing_Node *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpPLA_Flags class]])
        {
            _var_pla_flags = (UMDiameterAvpPLA_Flags *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpESMLC_Cell_Info class]])
        {
            _var_esmlc_cell_info = (UMDiameterAvpESMLC_Cell_Info *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpCivic_Address class]])
        {
            _var_civic_address = (UMDiameterAvpCivic_Address *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpBarometric_Pressure class]])
        {
            _var_barometric_pressure = (UMDiameterAvpBarometric_Pressure *)avp;
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
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"Result-Code"] = [_var_result_code objectValue];
	dict[@"Experimental-Result"] = [_var_experimental_result objectValue];
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Location-Estimate"] = [_var_location_estimate objectValue];
	dict[@"Accuracy-Fulfilment-Indicator"] = [_var_accuracy_fulfilment_indicator objectValue];
	dict[@"Age-Of-Location-Estimate"] = [_var_age_of_location_estimate objectValue];
	dict[@"Velocity-Estimate"] = [_var_velocity_estimate objectValue];
	dict[@"EUTRAN-Positioning-Data"] = [_var_eutran_positioning_data objectValue];
	dict[@"ECGI"] = [_var_ecgi objectValue];
	dict[@"GERAN-Positioning-Info"] = [_var_geran_positioning_info objectValue];
	dict[@"Cell-Global-Identity"] = [_var_cell_global_identity objectValue];
	dict[@"UTRAN-Positioning-Info"] = [_var_utran_positioning_info objectValue];
	dict[@"Service-Area-Identity"] = [_var_service_area_identity objectValue];
	dict[@"Serving-Node"] = [_var_serving_node objectValue];
	dict[@"PLA-Flags"] = [_var_pla_flags objectValue];
	dict[@"ESMLC-Cell-Info"] = [_var_esmlc_cell_info objectValue];
	dict[@"Civic-Address"] = [_var_civic_address objectValue];
	dict[@"Barometric-Pressure"] = [_var_barometric_pressure objectValue];
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

