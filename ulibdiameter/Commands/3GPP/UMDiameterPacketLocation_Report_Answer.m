//
//  UMDiameterPacketLocation_Report_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:15:40.115000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketLocation_Report_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpLRA_Flags.h"
#import "UMDiameterAvpReporting_PLMN_List.h"
#import "UMDiameterAvpLCS_Reference_Number.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketLocation_Report_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 8388621;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 8388621;
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
    if(_var_gmlc_address)
    {
        [arr addObject:_var_gmlc_address];
    }
    if(_var_lra_flags)
    {
        [arr addObject:_var_lra_flags];
    }
    if(_var_reporting_plmn_list)
    {
        [arr addObject:_var_reporting_plmn_list];
    }
    if(_var_lcs_reference_number)
    {
        [arr addObject:_var_lcs_reference_number];
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

    if(dict[@"gmlc-address"])
    {
        _var_gmlc_address = [[UMDiameterAvpGMLC_Address alloc]init];
        _var_gmlc_address.objectValue = dict[@"gmlc-address"];
    }

    if(dict[@"lra-flags"])
    {
        _var_lra_flags = [[UMDiameterAvpLRA_Flags alloc]init];
        _var_lra_flags.objectValue = dict[@"lra-flags"];
    }

    if(dict[@"reporting-plmn-list"])
    {
        _var_reporting_plmn_list = [[UMDiameterAvpReporting_PLMN_List alloc]init];
        _var_reporting_plmn_list.objectValue = dict[@"reporting-plmn-list"];
    }

    if(dict[@"lcs-reference-number"])
    {
        _var_lcs_reference_number = [[UMDiameterAvpLCS_Reference_Number alloc]init];
        _var_lcs_reference_number.objectValue = dict[@"lcs-reference-number"];
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
    if(_var_gmlc_address)
    {
        dict[@"gmlc-address"] = _var_gmlc_address.objectValue;
    }
    if(_var_lra_flags)
    {
        dict[@"lra-flags"] = _var_lra_flags.objectValue;
    }
    if(_var_reporting_plmn_list)
    {
        dict[@"reporting-plmn-list"] = _var_reporting_plmn_list.objectValue;
    }
    if(_var_lcs_reference_number)
    {
        dict[@"lcs-reference-number"] = _var_lcs_reference_number.objectValue;
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


    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];
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
    [UMDiameterAvpGMLC_Address appendWebDiameterParameters:s webName:@"gmlc-address"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLRA_Flags appendWebDiameterParameters:s webName:@"lra-flags"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpReporting_PLMN_List appendWebDiameterParameters:s webName:@"reporting-plmn-list"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpLCS_Reference_Number appendWebDiameterParameters:s webName:@"lcs-reference-number"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features"  comment:@"" css:@"optional"];
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

