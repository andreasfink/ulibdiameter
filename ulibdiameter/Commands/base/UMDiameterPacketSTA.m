//
//  UMDiameterPacketSTA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-10 00:07:37.123000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketSTA.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpClass.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpError_Reporting_Host.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpRedirect_Host.h"
#import "UMDiameterAvpRedirect_Host_Usage.h"
#import "UMDiameterAvpRedirect_Max_Cache_Time.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketSTA


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 275;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 275;
}

+ (uint32_t)defaultApplicationId
{
    return 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_session_id)
    {
        [arr addObject:_var_session_id];
    }
    if(_var_result_code)
    {
        [arr addObject:_var_result_code];
    }
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_class.count > 0)
    {
        for(UMDiameterAvpClass *o in _var_class)
        {
            [arr addObject:o];
        }
    }
    if(_var_error_message)
    {
        [arr addObject:_var_error_message];
    }
    if(_var_error_reporting_host)
    {
        [arr addObject:_var_error_reporting_host];
    }
    if(_var_failed_avp)
    {
        [arr addObject:_var_failed_avp];
    }
    if(_var_origin_state_id)
    {
        [arr addObject:_var_origin_state_id];
    }
    if(_var_redirect_host.count > 0)
    {
        for(UMDiameterAvpRedirect_Host *o in _var_redirect_host)
        {
            [arr addObject:o];
        }
    }
    if(_var_redirect_host_usage)
    {
        [arr addObject:_var_redirect_host_usage];
    }
    if(_var_redirect_max_cache_time)
    {
        [arr addObject:_var_redirect_max_cache_time];
    }
    if(_var_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _var_proxy_info)
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
    [self setAvps:arr];
}


- (void)setDictionaryValue:(NSDictionary *)dict
{

    if(dict[@"session-id"])
    {
        _var_session_id = [[UMDiameterAvpSession_Id alloc]init];
        _var_session_id.objectValue = dict[@"session-id"];
    }

    if(dict[@"result-code"])
    {
        _var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        _var_result_code.objectValue = dict[@"result-code"];
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

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"class"])
    {
        id obj = dict[@"class"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpClass *o = [[UMDiameterAvpClass alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_class = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpClass *o = [[UMDiameterAvpClass alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_class = arr;
        }
    }
    if(dict[@"error-message"])
    {
        _var_error_message = [[UMDiameterAvpError_Message alloc]init];
        _var_error_message.objectValue = dict[@"error-message"];
    }

    if(dict[@"error-reporting-host"])
    {
        _var_error_reporting_host = [[UMDiameterAvpError_Reporting_Host alloc]init];
        _var_error_reporting_host.objectValue = dict[@"error-reporting-host"];
    }

    if(dict[@"failed-avp"])
    {
        _var_failed_avp = [[UMDiameterAvpFailed_AVP alloc]init];
        _var_failed_avp.objectValue = dict[@"failed-avp"];
    }

    if(dict[@"origin-state-id"])
    {
        _var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        _var_origin_state_id.objectValue = dict[@"origin-state-id"];
    }

    if(dict[@"redirect-host"])
    {
        id obj = dict[@"redirect-host"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpRedirect_Host *o = [[UMDiameterAvpRedirect_Host alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_redirect_host = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpRedirect_Host *o = [[UMDiameterAvpRedirect_Host alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_redirect_host = arr;
        }
    }
    if(dict[@"redirect-host-usage"])
    {
        _var_redirect_host_usage = [[UMDiameterAvpRedirect_Host_Usage alloc]init];
        _var_redirect_host_usage.objectValue = dict[@"redirect-host-usage"];
    }

    if(dict[@"redirect-max-cache-time"])
    {
        _var_redirect_max_cache_time = [[UMDiameterAvpRedirect_Max_Cache_Time alloc]init];
        _var_redirect_max_cache_time.objectValue = dict[@"redirect-max-cache-time"];
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
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_var_session_id)
    {
        dict[@"session-id"] = _var_session_id.objectValue;
    }
    if(_var_result_code)
    {
        dict[@"result-code"] = _var_result_code.objectValue;
    }
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_class)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_class)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"class"] = arr;
    }
    if(_var_error_message)
    {
        dict[@"error-message"] = _var_error_message.objectValue;
    }
    if(_var_error_reporting_host)
    {
        dict[@"error-reporting-host"] = _var_error_reporting_host.objectValue;
    }
    if(_var_failed_avp)
    {
        dict[@"failed-avp"] = _var_failed_avp.objectValue;
    }
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
    }
    if(_var_redirect_host)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_redirect_host)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"redirect-host"] = arr;
    }
    if(_var_redirect_host_usage)
    {
        dict[@"redirect-host-usage"] = _var_redirect_host_usage.objectValue;
    }
    if(_var_redirect_max_cache_time)
    {
        dict[@"redirect-max-cache-time"] = _var_redirect_max_cache_time.objectValue;
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
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
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
    [s appendString:@"    <td class=mandatory>result-code</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"result-code\" type=text> </td>\n"];
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
    [s appendString:@"    <td class=optional>user-name</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"user-name\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>class</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"class\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>error-message</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"error-message\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>error-reporting-host</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"error-reporting-host\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>failed-avp</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"failed-avp\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>origin-state-id</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"origin-state-id\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>redirect-host</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"redirect-host\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>redirect-host-usage</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"redirect-host-usage\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>redirect-max-cache-time</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"redirect-max-cache-time\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>proxy-info</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"proxy-info\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>avp</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"avp\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

}

@end

