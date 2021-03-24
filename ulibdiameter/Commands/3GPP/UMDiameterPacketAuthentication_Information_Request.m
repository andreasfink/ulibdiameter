//
//  UMDiameterPacketAuthentication_Information_Request.m
//  ulibdiameter
//
//  Created by afink on 2021-03-23 23:12:20.320914
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
    self.applicationId = 16777251;
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
    if(_var_oc_supported_features)
    {
        [_var_oc_supported_features beforeEncode];
        [arr addObject:_var_oc_supported_features];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_requested_eutran_authentication_info)
    {
        [_var_requested_eutran_authentication_info beforeEncode];
        [arr addObject:_var_requested_eutran_authentication_info];
    }
    if(_var_requested_utran_geran_authentication_info)
    {
        [_var_requested_utran_geran_authentication_info beforeEncode];
        [arr addObject:_var_requested_utran_geran_authentication_info];
    }
    if(_var_visited_plmn_id)
    {
        [_var_visited_plmn_id beforeEncode];
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_air_flags)
    {
        [_var_air_flags beforeEncode];
        [arr addObject:_var_air_flags];
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


    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpDRMP appendWebDiameterParameters:s webName:@"drmp"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRequested_EUTRAN_Authentication_Info appendWebDiameterParameters:s webName:@"requested-eutran-authentication-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info appendWebDiameterParameters:s webName:@"requested-utran-geran-authentication-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:@"visited-plmn-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpAIR_Flags appendWebDiameterParameters:s webName:@"air-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record[]"  comment:@"" css:@"optional"];

}

- (void)afterDecode
{
    [super afterDecode];
    for(UMDiameterAvp *avp in _packet_avps)
    {
        if(avp.avpCode == [UMDiameterAvpSession_Id avpCode])
        {
            UMDiameterAvpSession_Id *avp2 = [[UMDiameterAvpSession_Id alloc]initWithAvp:avp];
            _var_session_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDRMP avpCode])
        {
            UMDiameterAvpDRMP *avp2 = [[UMDiameterAvpDRMP alloc]initWithAvp:avp];
            _var_drmp = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            _var_vendor_specific_application_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAuth_Session_State avpCode])
        {
            UMDiameterAvpAuth_Session_State *avp2 = [[UMDiameterAvpAuth_Session_State alloc]initWithAvp:avp];
            _var_auth_session_state = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOrigin_Host avpCode])
        {
            UMDiameterAvpOrigin_Host *avp2 = [[UMDiameterAvpOrigin_Host alloc]initWithAvp:avp];
            _var_origin_host = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOrigin_Realm avpCode])
        {
            UMDiameterAvpOrigin_Realm *avp2 = [[UMDiameterAvpOrigin_Realm alloc]initWithAvp:avp];
            _var_origin_realm = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_Host avpCode])
        {
            UMDiameterAvpDestination_Host *avp2 = [[UMDiameterAvpDestination_Host alloc]initWithAvp:avp];
            _var_destination_host = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_Realm avpCode])
        {
            UMDiameterAvpDestination_Realm *avp2 = [[UMDiameterAvpDestination_Realm alloc]initWithAvp:avp];
            _var_destination_realm = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpUser_Name avpCode])
        {
            UMDiameterAvpUser_Name *avp2 = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            _var_user_name = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Supported_Features avpCode])
        {
            UMDiameterAvpOC_Supported_Features *avp2 = [[UMDiameterAvpOC_Supported_Features alloc]initWithAvp:avp];
            _var_oc_supported_features = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSupported_Features avpCode])
        {
            UMDiameterAvpSupported_Features *avp2 = [[UMDiameterAvpSupported_Features alloc]initWithAvp:avp];
            if(_var_supported_features == NULL)
            {
                _var_supported_features = (NSArray<UMDiameterAvpSupported_Features *>*)@[avp2];
            }
            else
            {
                _var_supported_features = [_var_supported_features arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRequested_EUTRAN_Authentication_Info avpCode])
        {
            UMDiameterAvpRequested_EUTRAN_Authentication_Info *avp2 = [[UMDiameterAvpRequested_EUTRAN_Authentication_Info alloc]initWithAvp:avp];
            _var_requested_eutran_authentication_info = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info avpCode])
        {
            UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info *avp2 = [[UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info alloc]initWithAvp:avp];
            _var_requested_utran_geran_authentication_info = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            UMDiameterAvpVisited_PLMN_Id *avp2 = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _var_visited_plmn_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAIR_Flags avpCode])
        {
            UMDiameterAvpAIR_Flags *avp2 = [[UMDiameterAvpAIR_Flags alloc]initWithAvp:avp];
            _var_air_flags = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpProxy_Info avpCode])
        {
            UMDiameterAvpProxy_Info *avp2 = [[UMDiameterAvpProxy_Info alloc]initWithAvp:avp];
            if(_var_proxy_info == NULL)
            {
                _var_proxy_info = (NSArray<UMDiameterAvpProxy_Info *>*)@[avp2];
            }
            else
            {
                _var_proxy_info = [_var_proxy_info arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRoute_Record avpCode])
        {
            UMDiameterAvpRoute_Record *avp2 = [[UMDiameterAvpRoute_Record alloc]initWithAvp:avp];
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
    dict[@"Diameter-Version"] = @(_version);
    dict[@"Diameter-Command-Code"] = @(_commandCode);
    dict[@"Diameter-Command-Flags"] = @(_commandFlags);
    dict[@"Diameter-Application-Id"] = @(_applicationId);
    dict[@"Hop-by-Hop-Identifier"] = @(_hopByHopIdentifier);
    dict[@"End-to-End-Identifier"] = @(_endToEndIdentifier);
	dict[@"Session-Id"] = [_var_session_id objectValue];
	dict[@"DRMP"] = [_var_drmp objectValue];
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"OC-Supported-Features"] = [_var_oc_supported_features objectValue];
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
	dict[@"Requested-EUTRAN-Authentication-Info"] = [_var_requested_eutran_authentication_info objectValue];
	dict[@"Requested-UTRAN-GERAN-Authentication-Info"] = [_var_requested_utran_geran_authentication_info objectValue];
	dict[@"Visited-PLMN-Id"] = [_var_visited_plmn_id objectValue];
	dict[@"AIR-Flags"] = [_var_air_flags objectValue];
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
        def[@"mandatory"]=@(NO);
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Supported_Features definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Features definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRequested_EUTRAN_Authentication_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAIR_Flags definition];
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
    commandDef[@"command-name"] = @"Authentication-Information-Request";
    commandDef[@"web-name"] = @"authentication-information-request";
    commandDef[@"command-number"] = @(318);
    commandDef[@"application-id"] = @(16777251);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

