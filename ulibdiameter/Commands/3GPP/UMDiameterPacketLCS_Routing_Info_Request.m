//
//  UMDiameterPacketLCS_Routing_Info_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:27.022000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketLCS_Routing_Info_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpMSISDN.h"
#import "UMDiameterAvpGMLC_Number.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketLCS_Routing_Info_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 8388622;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 8388622;
}

+ (uint32_t)defaultApplicationId
{
    return 16777291;
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
    if(_var_destination_host)
    {
        [_var_destination_host beforeEncode];
        [arr addObject:_var_destination_host];
    }
    if(_var_destination_realm)
    {
        [_var_destination_realm beforeEncode];
        [arr addObject:_var_destination_realm];
    }
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_msisdn)
    {
        [_var_msisdn beforeEncode];
        [arr addObject:_var_msisdn];
    }
    if(_var_gmlc_number)
    {
        [_var_gmlc_number beforeEncode];
        [arr addObject:_var_gmlc_number];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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

    if(dict[@"msisdn"])
    {
        _var_msisdn = [[UMDiameterAvpMSISDN alloc]init];
        _var_msisdn.objectValue = dict[@"msisdn"];
    }

    if(dict[@"gmlc-number"])
    {
        _var_gmlc_number = [[UMDiameterAvpGMLC_Number alloc]init];
        _var_gmlc_number.objectValue = dict[@"gmlc-number"];
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
    if(_var_msisdn)
    {
        dict[@"msisdn"] = _var_msisdn.objectValue;
    }
    if(_var_gmlc_number)
    {
        dict[@"gmlc-number"] = _var_gmlc_number.objectValue;
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

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpMSISDN appendWebDiameterParameters:s webName:@"msisdn"  comment:@"" css:@"optional"];

    [UMDiameterAvpGMLC_Number appendWebDiameterParameters:s webName:@"gmlc-number"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

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
        else if([avp isKindOfClass:[UMDiameterAvpDestination_Host class]])
        {
            _var_destination_host = (UMDiameterAvpDestination_Host *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpDestination_Realm class]])
        {
            _var_destination_realm = (UMDiameterAvpDestination_Realm *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpUser_Name class]])
        {
            _var_user_name = (UMDiameterAvpUser_Name *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpMSISDN class]])
        {
            _var_msisdn = (UMDiameterAvpMSISDN *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpGMLC_Number class]])
        {
            _var_gmlc_number = (UMDiameterAvpGMLC_Number *)avp;
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
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"MSISDN"] = [_var_msisdn objectValue];
	dict[@"GMLC-Number"] = [_var_gmlc_number objectValue];
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
    [arr addObject: [UMDiameterAvpSession_Id definition]];
    [arr addObject: [UMDiameterAvpVendor_Specific_Application_Id definition]];
    [arr addObject: [UMDiameterAvpAuth_Session_State definition]];
    [arr addObject: [UMDiameterAvpOrigin_Host definition]];
    [arr addObject: [UMDiameterAvpOrigin_Realm definition]];
    [arr addObject: [UMDiameterAvpDestination_Host definition]];
    [arr addObject: [UMDiameterAvpDestination_Realm definition]];
    [arr addObject: [UMDiameterAvpUser_Name definition]];
    [arr addObject: [UMDiameterAvpMSISDN definition]];
    [arr addObject: [UMDiameterAvpGMLC_Number definition]];
    [arr addObject: [UMDiameterAvpSupported_Features definition]];
    [arr addObject: [UMDiameterAvpProxy_Info definition]];
    [arr addObject: [UMDiameterAvpRoute_Record definition]];

    UMSynchronizedSortedDictionary *commandDef = [[UMSynchronizedSortedDictionary alloc]init];
    commandDef[@"command-name"] = @"LCS-Routing-Info-Request";
    commandDef[@"web-name"] = @"lcs-routing-info-request";
    commandDef[@"command-number"] = @(8388622);
    commandDef[@"application-id"] = @(16777291);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

