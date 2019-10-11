//
//  UMDiameterPacketSubscribe_Notifications_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 06:37:27.929000
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
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
        {
            [arr addObject:o];
        }
    }
    if(_var_user_identity)
    {
        [arr addObject:_var_user_identity];
    }
    if(_var_wildcarded_public_identity)
    {
        [arr addObject:_var_wildcarded_public_identity];
    }
    if(_var_service_indication.count > 0)
    {
        for(UMDiameterAvpService_Indication *o in _var_service_indication)
        {
            [arr addObject:o];
        }
    }
    if(_var_send_data_indication)
    {
        [arr addObject:_var_send_data_indication];
    }
    if(_var_server_name)
    {
        [arr addObject:_var_server_name];
    }
    if(_var_subs_req_type)
    {
        [arr addObject:_var_subs_req_type];
    }
    if(_var_data_reference.count > 0)
    {
        for(UMDiameterAvpData_Reference *o in _var_data_reference)
        {
            [arr addObject:o];
        }
    }
    if(_var_identity_set.count > 0)
    {
        for(UMDiameterAvpIdentity_Set *o in _var_identity_set)
        {
            [arr addObject:o];
        }
    }
    if(_var_expiry_time)
    {
        [arr addObject:_var_expiry_time];
    }
    if(_var_dsai_tag.count > 0)
    {
        for(UMDiameterAvpDSAI_Tag *o in _var_dsai_tag)
        {
            [arr addObject:o];
        }
    }
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_oc_supported_features)
    {
        [arr addObject:_var_oc_supported_features];
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

@end
