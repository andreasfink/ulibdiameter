//
//  UMDiameterPacketSubscribe_Notifications_Request.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:04:58.824494
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketSubscribe_Notifications_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpUser_Identity.h"
#import "UMDiameterAvpWildcarded_Public_Identity.h"
#import "UMDiameterAvpService_Indication.h"
#import "UMDiameterAvpSend_Data_Indication.h"
#import "UMDiameterAvpServer_Name.h"
#import "UMDiameterAvpSubs_Req_Type.h"
#import "UMDiameterAvpData_Reference.h"
#import "UMDiameterAvpIdentity_Set.h"
#import "UMDiameterAvpExpiry_Time.h"
#import "UMDiameterAvpDSAI_Tag.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketSubscribe_Notifications_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 308;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 308;
}

+ (uint32_t)defaultApplicationId
{
    return 16777217;
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
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_user_identity)
    {
        [_var_user_identity beforeEncode];
        [arr addObject:_var_user_identity];
    }
    if(_var_wildcarded_public_identity)
    {
        [_var_wildcarded_public_identity beforeEncode];
        [arr addObject:_var_wildcarded_public_identity];
    }
    if(_var_service_indication.count > 0)
    {
        for(UMDiameterAvpService_Indication *o in _var_service_indication)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_send_data_indication)
    {
        [_var_send_data_indication beforeEncode];
        [arr addObject:_var_send_data_indication];
    }
    if(_var_server_name)
    {
        [_var_server_name beforeEncode];
        [arr addObject:_var_server_name];
    }
    if(_var_subs_req_type)
    {
        [_var_subs_req_type beforeEncode];
        [arr addObject:_var_subs_req_type];
    }
    if(_var_data_reference.count > 0)
    {
        for(UMDiameterAvpData_Reference *o in _var_data_reference)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_identity_set.count > 0)
    {
        for(UMDiameterAvpIdentity_Set *o in _var_identity_set)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_expiry_time)
    {
        [_var_expiry_time beforeEncode];
        [arr addObject:_var_expiry_time];
    }
    if(_var_dsai_tag.count > 0)
    {
        for(UMDiameterAvpDSAI_Tag *o in _var_dsai_tag)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
    if(dict[@"user-identity"])
    {
        _var_user_identity = [[UMDiameterAvpUser_Identity alloc]init];
        _var_user_identity.objectValue = dict[@"user-identity"];
    }

    if(dict[@"wildcarded-public-identity"])
    {
        _var_wildcarded_public_identity = [[UMDiameterAvpWildcarded_Public_Identity alloc]init];
        _var_wildcarded_public_identity.objectValue = dict[@"wildcarded-public-identity"];
    }

    if(dict[@"service-indication"])
    {
        id obj = dict[@"service-indication"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpService_Indication *o = [[UMDiameterAvpService_Indication alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_service_indication = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpService_Indication *o = [[UMDiameterAvpService_Indication alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_service_indication = arr;
        }
    }
    if(dict[@"send-data-indication"])
    {
        _var_send_data_indication = [[UMDiameterAvpSend_Data_Indication alloc]init];
        _var_send_data_indication.objectValue = dict[@"send-data-indication"];
    }

    if(dict[@"server-name"])
    {
        _var_server_name = [[UMDiameterAvpServer_Name alloc]init];
        _var_server_name.objectValue = dict[@"server-name"];
    }

    if(dict[@"subs-req-type"])
    {
        _var_subs_req_type = [[UMDiameterAvpSubs_Req_Type alloc]init];
        _var_subs_req_type.objectValue = dict[@"subs-req-type"];
    }

    if(dict[@"data-reference"])
    {
        id obj = dict[@"data-reference"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpData_Reference *o = [[UMDiameterAvpData_Reference alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_data_reference = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpData_Reference *o = [[UMDiameterAvpData_Reference alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_data_reference = arr;
        }
    }
    if(dict[@"identity-set"])
    {
        id obj = dict[@"identity-set"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpIdentity_Set *o = [[UMDiameterAvpIdentity_Set alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_identity_set = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpIdentity_Set *o = [[UMDiameterAvpIdentity_Set alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_identity_set = arr;
        }
    }
    if(dict[@"expiry-time"])
    {
        _var_expiry_time = [[UMDiameterAvpExpiry_Time alloc]init];
        _var_expiry_time.objectValue = dict[@"expiry-time"];
    }

    if(dict[@"dsai-tag"])
    {
        id obj = dict[@"dsai-tag"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpDSAI_Tag *o = [[UMDiameterAvpDSAI_Tag alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_dsai_tag = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpDSAI_Tag *o = [[UMDiameterAvpDSAI_Tag alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_dsai_tag = arr;
        }
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
    if(_var_supported_features)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_features)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-features"] = arr;
    }
    if(_var_user_identity)
    {
        dict[@"user-identity"] = _var_user_identity.objectValue;
    }
    if(_var_wildcarded_public_identity)
    {
        dict[@"wildcarded-public-identity"] = _var_wildcarded_public_identity.objectValue;
    }
    if(_var_service_indication)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_service_indication)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"service-indication"] = arr;
    }
    if(_var_send_data_indication)
    {
        dict[@"send-data-indication"] = _var_send_data_indication.objectValue;
    }
    if(_var_server_name)
    {
        dict[@"server-name"] = _var_server_name.objectValue;
    }
    if(_var_subs_req_type)
    {
        dict[@"subs-req-type"] = _var_subs_req_type.objectValue;
    }
    if(_var_data_reference)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_data_reference)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"data-reference"] = arr;
    }
    if(_var_identity_set)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_identity_set)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"identity-set"] = arr;
    }
    if(_var_expiry_time)
    {
        dict[@"expiry-time"] = _var_expiry_time.objectValue;
    }
    if(_var_dsai_tag)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_dsai_tag)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"dsai-tag"] = arr;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_oc_supported_features)
    {
        dict[@"oc-supported-features"] = _var_oc_supported_features.objectValue;
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

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpUser_Identity appendWebDiameterParameters:s webName:@"user-identity"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpWildcarded_Public_Identity appendWebDiameterParameters:s webName:@"wildcarded-public-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpService_Indication appendWebDiameterParameters:s webName:@"service-indication[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpSend_Data_Indication appendWebDiameterParameters:s webName:@"send-data-indication"  comment:@"" css:@"optional"];

    [UMDiameterAvpServer_Name appendWebDiameterParameters:s webName:@"server-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpSubs_Req_Type appendWebDiameterParameters:s webName:@"subs-req-type"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpData_Reference appendWebDiameterParameters:s webName:@"data-reference[]"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpIdentity_Set appendWebDiameterParameters:s webName:@"identity-set[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpExpiry_Time appendWebDiameterParameters:s webName:@"expiry-time"  comment:@"" css:@"optional"];

    [UMDiameterAvpDSAI_Tag appendWebDiameterParameters:s webName:@"dsai-tag[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

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
        else if(avp.avpCode == [UMDiameterAvpUser_Identity avpCode])
        {
            UMDiameterAvpUser_Identity *avp2 = [[UMDiameterAvpUser_Identity alloc]initWithAvp:avp];
            _var_user_identity = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpWildcarded_Public_Identity avpCode])
        {
            UMDiameterAvpWildcarded_Public_Identity *avp2 = [[UMDiameterAvpWildcarded_Public_Identity alloc]initWithAvp:avp];
            _var_wildcarded_public_identity = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpService_Indication avpCode])
        {
            UMDiameterAvpService_Indication *avp2 = [[UMDiameterAvpService_Indication alloc]initWithAvp:avp];
            if(_var_service_indication == NULL)
            {
                _var_service_indication = (NSArray<UMDiameterAvpService_Indication *>*)@[avp2];
            }
            else
            {
                _var_service_indication = [_var_service_indication arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpSend_Data_Indication avpCode])
        {
            UMDiameterAvpSend_Data_Indication *avp2 = [[UMDiameterAvpSend_Data_Indication alloc]initWithAvp:avp];
            _var_send_data_indication = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpServer_Name avpCode])
        {
            UMDiameterAvpServer_Name *avp2 = [[UMDiameterAvpServer_Name alloc]initWithAvp:avp];
            _var_server_name = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpSubs_Req_Type avpCode])
        {
            UMDiameterAvpSubs_Req_Type *avp2 = [[UMDiameterAvpSubs_Req_Type alloc]initWithAvp:avp];
            _var_subs_req_type = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpData_Reference avpCode])
        {
            UMDiameterAvpData_Reference *avp2 = [[UMDiameterAvpData_Reference alloc]initWithAvp:avp];
            if(_var_data_reference == NULL)
            {
                _var_data_reference = (NSArray<UMDiameterAvpData_Reference *>*)@[avp2];
            }
            else
            {
                _var_data_reference = [_var_data_reference arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpIdentity_Set avpCode])
        {
            UMDiameterAvpIdentity_Set *avp2 = [[UMDiameterAvpIdentity_Set alloc]initWithAvp:avp];
            if(_var_identity_set == NULL)
            {
                _var_identity_set = (NSArray<UMDiameterAvpIdentity_Set *>*)@[avp2];
            }
            else
            {
                _var_identity_set = [_var_identity_set arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpExpiry_Time avpCode])
        {
            UMDiameterAvpExpiry_Time *avp2 = [[UMDiameterAvpExpiry_Time alloc]initWithAvp:avp];
            _var_expiry_time = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDSAI_Tag avpCode])
        {
            UMDiameterAvpDSAI_Tag *avp2 = [[UMDiameterAvpDSAI_Tag alloc]initWithAvp:avp];
            if(_var_dsai_tag == NULL)
            {
                _var_dsai_tag = (NSArray<UMDiameterAvpDSAI_Tag *>*)@[avp2];
            }
            else
            {
                _var_dsai_tag = [_var_dsai_tag arrayByAddingObject:avp2];
            }
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
	dict[@"Session-Id"] = [_var_session_id objectValue];
	dict[@"DRMP"] = [_var_drmp objectValue];
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"Auth-Session-State"] = [_var_auth_session_state objectValue];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
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
	dict[@"User-Identity"] = [_var_user_identity objectValue];
	dict[@"Wildcarded-Public-Identity"] = [_var_wildcarded_public_identity objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_service_indication.count>0)
		{
			for(UMDiameterAvp *avp in _var_service_indication)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Service-Indication"] = arr;
		}
	}
	dict[@"Send-Data-Indication"] = [_var_send_data_indication objectValue];
	dict[@"Server-Name"] = [_var_server_name objectValue];
	dict[@"Subs-Req-Type"] = [_var_subs_req_type objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_data_reference.count>0)
		{
			for(UMDiameterAvp *avp in _var_data_reference)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Data-Reference"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_identity_set.count>0)
		{
			for(UMDiameterAvp *avp in _var_identity_set)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Identity-Set"] = arr;
		}
	}
	dict[@"Expiry-Time"] = [_var_expiry_time objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_dsai_tag.count>0)
		{
			for(UMDiameterAvp *avp in _var_dsai_tag)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"DSAI-Tag"] = arr;
		}
	}
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"OC-Supported-Features"] = [_var_oc_supported_features objectValue];
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
        def[@"mandatory"]=@(YES);
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Features definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpWildcarded_Public_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Indication definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSend_Data_Indication definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpServer_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubs_Req_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpData_Reference definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIdentity_Set definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExpiry_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDSAI_Tag definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Supported_Features definition];
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
    commandDef[@"command-name"] = @"Subscribe-Notifications-Request";
    commandDef[@"web-name"] = @"subscribe-notifications-request";
    commandDef[@"command-number"] = @(308);
    commandDef[@"application-id"] = @(16777217);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

