//
//  UMDiameterPacketCancel_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 08:40:59.745795
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketCancel_Location_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpCancellation_Type.h"
#import "UMDiameterAvpCLR_Flags.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketCancel_Location_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 317;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 317;
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
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_cancellation_type)
    {
        [_var_cancellation_type beforeEncode];
        [arr addObject:_var_cancellation_type];
    }
    if(_var_clr_flags)
    {
        [_var_clr_flags beforeEncode];
        [arr addObject:_var_clr_flags];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
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
    if(dict[@"cancellation-type"])
    {
        _var_cancellation_type = [[UMDiameterAvpCancellation_Type alloc]init];
        _var_cancellation_type.objectValue = dict[@"cancellation-type"];
    }

    if(dict[@"clr-flags"])
    {
        _var_clr_flags = [[UMDiameterAvpCLR_Flags alloc]init];
        _var_clr_flags.objectValue = dict[@"clr-flags"];
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
    if(_var_supported_features)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_features)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-features"] = arr;
    }
    if(_var_cancellation_type)
    {
        dict[@"cancellation-type"] = _var_cancellation_type.objectValue;
    }
    if(_var_clr_flags)
    {
        dict[@"clr-flags"] = _var_clr_flags.objectValue;
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


    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpDRMP appendWebDiameterParameters:s webName:@"drmp"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpCancellation_Type appendWebDiameterParameters:s webName:@"cancellation-type"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpCLR_Flags appendWebDiameterParameters:s webName:@"clr-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record[]"  comment:@"" css:@"optional"];

}

- (void)afterDecode
{
    for(UMDiameterAvp *avp in _packet_avps)
    {
        if(avp.avpCode == [UMDiameterAvpSession_Id avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpSession_Id alloc]initWithAvp:avp];
            _var_session_id = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpDRMP avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpDRMP alloc]initWithAvp:avp];
            _var_drmp = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            _var_vendor_specific_application_id = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpAuth_Session_State avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpAuth_Session_State alloc]initWithAvp:avp];
            _var_auth_session_state = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpOrigin_Host avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpOrigin_Host alloc]initWithAvp:avp];
            _var_origin_host = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpOrigin_Realm avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpOrigin_Realm alloc]initWithAvp:avp];
            _var_origin_realm = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpDestination_Host avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpDestination_Host alloc]initWithAvp:avp];
            _var_destination_host = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpDestination_Realm avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpDestination_Realm alloc]initWithAvp:avp];
            _var_destination_realm = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpUser_Name avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            _var_user_name = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpSupported_Features avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpSupported_Features alloc]initWithAvp:avp];
            if(_var_supported_features == NULL)
            {
                _var_supported_features = (NSArray<UMDiameterAvpSupported_Features *>*)@[avp2];
            }
            else
            {
                _var_supported_features = [_var_supported_features arrayByAddingObject:avp2];
            }
        }
        if(avp.avpCode == [UMDiameterAvpCancellation_Type avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpCancellation_Type alloc]initWithAvp:avp];
            _var_cancellation_type = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpCLR_Flags avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpCLR_Flags alloc]initWithAvp:avp];
            _var_clr_flags = avp2;
            [knownAVPs addObject:avp2]
        }
        if(avp.avpCode == [UMDiameterAvpProxy_Info avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpProxy_Info alloc]initWithAvp:avp];
            if(_var_proxy_info == NULL)
            {
                _var_proxy_info = (NSArray<UMDiameterAvpProxy_Info *>*)@[avp2];
            }
            else
            {
                _var_proxy_info = [_var_proxy_info arrayByAddingObject:avp2];
            }
        }
        if(avp.avpCode == [UMDiameterAvpRoute_Record avpCode])
        {
                UMDiameterAvp *avp2 = [[UMDiameterAvpRoute_Record alloc]initWithAvp:avp];
            if(_var_route_record == NULL)
            {
                _var_route_record = (NSArray<UMDiameterAvpRoute_Record *>*)@[avp2];
            }
            else
            {
                _var_route_record = [_var_route_record arrayByAddingObject:avp2];
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
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
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
	dict[@"Cancellation-Type"] = [_var_cancellation_type objectValue];
	dict[@"CLR-Flags"] = [_var_clr_flags objectValue];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDRMP definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Specific_Application_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAuth_Session_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Host definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Features definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCancellation_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCLR_Flags definition];
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
    commandDef[@"command-name"] = @"Cancel-Location-Request";
    commandDef[@"web-name"] = @"cancel-location-request";
    commandDef[@"command-number"] = @(317);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

