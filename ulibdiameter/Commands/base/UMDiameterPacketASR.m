//
//  UMDiameterPacketASR.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:25:22.533751
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketASR.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketASR


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 274;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 274;
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
    if(_var_destination_realm)
    {
        [_var_destination_realm beforeEncode];
        [arr addObject:_var_destination_realm];
    }
    if(_var_destination_host)
    {
        [_var_destination_host beforeEncode];
        [arr addObject:_var_destination_host];
    }
    if(_var_auth_application_id)
    {
        [_var_auth_application_id beforeEncode];
        [arr addObject:_var_auth_application_id];
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

    if(dict[@"destination-realm"])
    {
        _var_destination_realm = [[UMDiameterAvpDestination_Realm alloc]init];
        _var_destination_realm.objectValue = dict[@"destination-realm"];
    }

    if(dict[@"destination-host"])
    {
        _var_destination_host = [[UMDiameterAvpDestination_Host alloc]init];
        _var_destination_host.objectValue = dict[@"destination-host"];
    }

    if(dict[@"auth-application-id"])
    {
        _var_auth_application_id = [[UMDiameterAvpAuth_Application_Id alloc]init];
        _var_auth_application_id.objectValue = dict[@"auth-application-id"];
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
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_destination_realm)
    {
        dict[@"destination-realm"] = _var_destination_realm.objectValue;
    }
    if(_var_destination_host)
    {
        dict[@"destination-host"] = _var_destination_host.objectValue;
    }
    if(_var_auth_application_id)
    {
        dict[@"auth-application-id"] = _var_auth_application_id.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
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

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpAuth_Application_Id appendWebDiameterParameters:s webName:@"auth-application-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];

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
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_Host class]])
        {
            _var_origin_host = (UMDiameterAvpOrigin_Host *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_Realm class]])
        {
            _var_origin_realm = (UMDiameterAvpOrigin_Realm *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpDestination_Realm class]])
        {
            _var_destination_realm = (UMDiameterAvpDestination_Realm *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpDestination_Host class]])
        {
            _var_destination_host = (UMDiameterAvpDestination_Host *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpAuth_Application_Id class]])
        {
            _var_auth_application_id = (UMDiameterAvpAuth_Application_Id *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpUser_Name class]])
        {
            _var_user_name = (UMDiameterAvpUser_Name *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_State_Id class]])
        {
            _var_origin_state_id = (UMDiameterAvpOrigin_State_Id *)avp;
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
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Auth-Application-Id"] = [_var_auth_application_id objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"Origin-State-Id"] = [_var_origin_state_id objectValue];
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
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSession_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAuth_Application_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_State_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProxy_Info definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRoute_Record definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }

    UMSynchronizedSortedDictionary *commandDef = [[UMSynchronizedSortedDictionary alloc]init];
    commandDef[@"command-name"] = @"ASR";
    commandDef[@"web-name"] = @"asr";
    commandDef[@"command-number"] = @(274);
    commandDef[@"application-id"] = @(0);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

