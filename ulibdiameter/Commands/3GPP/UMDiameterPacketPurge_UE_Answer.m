//
//  UMDiameterPacketPurge_UE_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:49:11.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketPurge_UE_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpOC_OLR.h"
#import "UMDiameterAvpLoad.h"
#import "UMDiameterAvpPUA_Flags.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketPurge_UE_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 321;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 321;
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
    if(_var_oc_supported_features)
    {
        [_var_oc_supported_features beforeEncode];
        [arr addObject:_var_oc_supported_features];
    }
    if(_var_oc_olr)
    {
        [_var_oc_olr beforeEncode];
        [arr addObject:_var_oc_olr];
    }
    if(_var_load.count > 0)
    {
        for(UMDiameterAvpLoad *o in _var_load)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_pua_flags)
    {
        [_var_pua_flags beforeEncode];
        [arr addObject:_var_pua_flags];
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

    if(dict[@"oc-supported-features"])
    {
        _var_oc_supported_features = [[UMDiameterAvpOC_Supported_Features alloc]init];
        _var_oc_supported_features.objectValue = dict[@"oc-supported-features"];
    }

    if(dict[@"oc-olr"])
    {
        _var_oc_olr = [[UMDiameterAvpOC_OLR alloc]init];
        _var_oc_olr.objectValue = dict[@"oc-olr"];
    }

    if(dict[@"load"])
    {
        id obj = dict[@"load"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpLoad *o = [[UMDiameterAvpLoad alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_load = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpLoad *o = [[UMDiameterAvpLoad alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_load = arr;
        }
    }
    if(dict[@"pua-flags"])
    {
        _var_pua_flags = [[UMDiameterAvpPUA_Flags alloc]init];
        _var_pua_flags.objectValue = dict[@"pua-flags"];
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
    if(_var_oc_supported_features)
    {
        dict[@"oc-supported-features"] = _var_oc_supported_features.objectValue;
    }
    if(_var_oc_olr)
    {
        dict[@"oc-olr"] = _var_oc_olr.objectValue;
    }
    if(_var_load)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_load)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"load"] = arr;
    }
    if(_var_pua_flags)
    {
        dict[@"pua-flags"] = _var_pua_flags.objectValue;
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

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

    [UMDiameterAvpOC_OLR appendWebDiameterParameters:s webName:@"oc-olr"  comment:@"" css:@"optional"];

    [UMDiameterAvpLoad appendWebDiameterParameters:s webName:@"load[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpPUA_Flags appendWebDiameterParameters:s webName:@"pua-flags"  comment:@"" css:@"optional"];

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
        else if([avp isKindOfClass:[UMDiameterAvpOC_Supported_Features class]])
        {
            _var_oc_supported_features = (UMDiameterAvpOC_Supported_Features *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOC_OLR class]])
        {
            _var_oc_olr = (UMDiameterAvpOC_OLR *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpLoad class]])
        {
            if(_var_load == NULL)
            {
                _var_load = (NSArray<UMDiameterAvpLoad *>*)@[avp];
            }
            else
            {
                _var_load = [_var_load arrayByAddingObject:(UMDiameterAvpLoad *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpPUA_Flags class]])
        {
            _var_pua_flags = (UMDiameterAvpPUA_Flags *)avp;
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
	dict[@"OC-Supported-Features"] = [_var_oc_supported_features objectValue];
	dict[@"OC-OLR"] = [_var_oc_olr objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_load.count>0)
		{
			for(UMDiameterAvp *avp in _var_load)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Load"] = arr;
		}
	}
	dict[@"PUA-Flags"] = [_var_pua_flags objectValue];
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
    [arr addObject:@{ @"_var_session_id" : [UMDiameterAvpSession_Id definition] }];
    [arr addObject:@{ @"_var_drmp" : [UMDiameterAvpDRMP definition] }];
    [arr addObject:@{ @"_var_vendor_specific_application_id" : [UMDiameterAvpVendor_Specific_Application_Id definition] }];
    [arr addObject:@{ @"_var_supported_features" : [UMDiameterAvpSupported_Features definition] }];
    [arr addObject:@{ @"_var_result_code" : [UMDiameterAvpResult_Code definition] }];
    [arr addObject:@{ @"_var_experimental_result" : [UMDiameterAvpExperimental_Result definition] }];
    [arr addObject:@{ @"_var_auth_session_state" : [UMDiameterAvpAuth_Session_State definition] }];
    [arr addObject:@{ @"_var_origin_host" : [UMDiameterAvpOrigin_Host definition] }];
    [arr addObject:@{ @"_var_origin_realm" : [UMDiameterAvpOrigin_Realm definition] }];
    [arr addObject:@{ @"_var_oc_supported_features" : [UMDiameterAvpOC_Supported_Features definition] }];
    [arr addObject:@{ @"_var_oc_olr" : [UMDiameterAvpOC_OLR definition] }];
    [arr addObject:@{ @"_var_load" : [UMDiameterAvpLoad definition] }];
    [arr addObject:@{ @"_var_pua_flags" : [UMDiameterAvpPUA_Flags definition] }];
    [arr addObject:@{ @"_var_failed_avp" : [UMDiameterAvpFailed_AVP definition] }];
    [arr addObject:@{ @"_var_proxy_info" : [UMDiameterAvpProxy_Info definition] }];
    [arr addObject:@{ @"_var_route_record" : [UMDiameterAvpRoute_Record definition] }];

    UMSynchronizedSortedDictionary *commandDef = [[UMSynchronizedSortedDictionary alloc]init];
    commandDef[@"command-name"] = @"Purge-UE-Answer";
    commandDef[@"web-name"] = @"purge-ue-answer";
    commandDef[@"command-number"] = @(321);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(NO);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

