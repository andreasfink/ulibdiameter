//
//  UMDiameterPacketRAA.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 08:53:30.687000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketRAA.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpError_Reporting_Host.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpRedirect_Host.h"
#import "UMDiameterAvpRedirect_Host_Usage.h"
#import "UMDiameterAvpRedirect_Max_Cache_Time.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketRAA


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 258;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 258;
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
        [_var_session_id beforeEncode];
        [arr addObject:_var_session_id];
    }
    if(_var_result_code)
    {
        [_var_result_code beforeEncode];
        [arr addObject:_var_result_code];
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
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_origin_state_id)
    {
        [_var_origin_state_id beforeEncode];
        [arr addObject:_var_origin_state_id];
    }
    if(_var_error_message)
    {
        [_var_error_message beforeEncode];
        [arr addObject:_var_error_message];
    }
    if(_var_error_reporting_host)
    {
        [_var_error_reporting_host beforeEncode];
        [arr addObject:_var_error_reporting_host];
    }
    if(_var_failed_avp)
    {
        [_var_failed_avp beforeEncode];
        [arr addObject:_var_failed_avp];
    }
    if(_var_redirect_host.count > 0)
    {
        for(UMDiameterAvpRedirect_Host *o in _var_redirect_host)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_redirect_host_usage)
    {
        [_var_redirect_host_usage beforeEncode];
        [arr addObject:_var_redirect_host_usage];
    }
    if(_var_redirect_max_cache_time)
    {
        [_var_redirect_max_cache_time beforeEncode];
        [arr addObject:_var_redirect_max_cache_time];
    }
    if(_var_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _var_proxy_info)
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

    if(dict[@"origin-state-id"])
    {
        _var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        _var_origin_state_id.objectValue = dict[@"origin-state-id"];
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
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
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


    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpError_Message appendWebDiameterParameters:s webName:@"error-message"  comment:@"" css:@"optional"];

    [UMDiameterAvpError_Reporting_Host appendWebDiameterParameters:s webName:@"error-reporting-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpFailed_AVP appendWebDiameterParameters:s webName:@"failed-avp"  comment:@"" css:@"optional"];

    [UMDiameterAvpRedirect_Host appendWebDiameterParameters:s webName:@"redirect-host[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRedirect_Host_Usage appendWebDiameterParameters:s webName:@"redirect-host-usage"  comment:@"" css:@"optional"];

    [UMDiameterAvpRedirect_Max_Cache_Time appendWebDiameterParameters:s webName:@"redirect-max-cache-time"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

}


- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Session-Id"] = [_var_session_id objectValue];
	dict[@"Result-Code"] = [_var_result_code objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"Origin-State-Id"] = [_var_origin_state_id objectValue];
	dict[@"Error-Message"] = [_var_error_message objectValue];
	dict[@"Error-Reporting-Host"] = [_var_error_reporting_host objectValue];
	dict[@"Failed-AVP"] = [_var_failed_avp objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		for(UMDiameterAvp *avp in _var_redirect_host)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Redirect-Host"] = arr;
	}
	dict[@"Redirect-Host-Usage"] = [_var_redirect_host_usage objectValue];
	dict[@"Redirect-Max-Cache-Time"] = [_var_redirect_max_cache_time objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		for(UMDiameterAvp *avp in _var_proxy_info)
		{
			[arr addObject:[avp objectValue]];
		}
		dict[@"Proxy-Info"] = arr;
	}
	return dict;
}

@end

