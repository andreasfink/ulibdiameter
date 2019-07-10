//
//  UMDiameterPacketAuthentication_Information_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-10 00:07:33.007000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketAuthentication_Information_Request.h"
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
#import "UMDiameterAvpRequested_EUTRAN_Authentication_Info.h"
#import "UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAIR_Flags.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketAuthentication_Information_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 318;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 318;
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
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_oc_supported_features)
    {
        [arr addObject:_var_oc_supported_features];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [arr addObject:o];
        }
    }
    if(_var_requested_eutran_authentication_info)
    {
        [arr addObject:_var_requested_eutran_authentication_info];
    }
    if(_var_requested_utran_geran_authentication_info)
    {
        [arr addObject:_var_requested_utran_geran_authentication_info];
    }
    if(_var_visited_plmn_id)
    {
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_air_flags)
    {
        [arr addObject:_var_air_flags];
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
    if(dict[@"requested-eutran-authentication-info"])
    {
        _var_requested_eutran_authentication_info = [[UMDiameterAvpRequested_EUTRAN_Authentication_Info alloc]init];
        _var_requested_eutran_authentication_info.objectValue = dict[@"requested-eutran-authentication-info"];
    }

    if(dict[@"requested-utran-geran-authentication-info"])
    {
        _var_requested_utran_geran_authentication_info = [[UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info alloc]init];
        _var_requested_utran_geran_authentication_info.objectValue = dict[@"requested-utran-geran-authentication-info"];
    }

    if(dict[@"visited-plmn-id"])
    {
        _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]init];
        _var_visited_plmn_id.objectValue = dict[@"visited-plmn-id"];
    }

    if(dict[@"air-flags"])
    {
        _var_air_flags = [[UMDiameterAvpAIR_Flags alloc]init];
        _var_air_flags.objectValue = dict[@"air-flags"];
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
    if(_var_requested_eutran_authentication_info)
    {
        dict[@"requested-eutran-authentication-info"] = _var_requested_eutran_authentication_info.objectValue;
    }
    if(_var_requested_utran_geran_authentication_info)
    {
        dict[@"requested-utran-geran-authentication-info"] = _var_requested_utran_geran_authentication_info.objectValue;
    }
    if(_var_visited_plmn_id)
    {
        dict[@"visited-plmn-id"] = _var_visited_plmn_id.objectValue;
    }
    if(_var_air_flags)
    {
        dict[@"air-flags"] = _var_air_flags.objectValue;
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
    [s appendString:@"    <td class=optional>session-id</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"session-id\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>drmp</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"drmp\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>vendor-specific-application-id</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"vendor-specific-application-id\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>auth-session-state</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"auth-session-state\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>origin-host</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"origin-host\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>origin-realm</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"origin-realm\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>destination-host</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"destination-host\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>destination-realm</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"destination-realm\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>user-name</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"user-name\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>oc-supported-features</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"oc-supported-features\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>supported-features</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"supported-features\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>requested-eutran-authentication-info</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"requested-eutran-authentication-info\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>requested-utran-geran-authentication-info</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"requested-utran-geran-authentication-info\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>visited-plmn-id</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"visited-plmn-id\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>air-flags</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"air-flags\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>avp</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"avp\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>proxy-info</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"proxy-info\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>route-record</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"route-record\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

}

@end

