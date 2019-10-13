//
//  UMDiameterPacketUser_Data_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 14:17:05.139000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketUser_Data_Request.h"
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
#import "UMDiameterAvpWildcarded_IMPU.h"
#import "UMDiameterAvpServer_Name.h"
#import "UMDiameterAvpService_Indication.h"
#import "UMDiameterAvpData_Reference.h"
#import "UMDiameterAvpIdentity_Set.h"
#import "UMDiameterAvpRequested_Domain.h"
#import "UMDiameterAvpCurrent_Location.h"
#import "UMDiameterAvpDSAI_Tag.h"
#import "UMDiameterAvpSession_Priority.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpRequested_Nodes.h"
#import "UMDiameterAvpServing_Node_Indication.h"
#import "UMDiameterAvpPre_paging_Supported.h"
#import "UMDiameterAvpLocal_Time_Zone_Indication.h"
#import "UMDiameterAvpCall_Reference_Info.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketUser_Data_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 306;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 306;
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
    if(_var_wildcarded_impu)
    {
        [_var_wildcarded_impu beforeEncode];
        [arr addObject:_var_wildcarded_impu];
    }
    if(_var_server_name)
    {
        [_var_server_name beforeEncode];
        [arr addObject:_var_server_name];
    }
    if(_var_service_indication.count > 0)
    {
        for(UMDiameterAvpService_Indication *o in _var_service_indication)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
    if(_var_requested_domain)
    {
        [_var_requested_domain beforeEncode];
        [arr addObject:_var_requested_domain];
    }
    if(_var_current_location)
    {
        [_var_current_location beforeEncode];
        [arr addObject:_var_current_location];
    }
    if(_var_dsai_tag.count > 0)
    {
        for(UMDiameterAvpDSAI_Tag *o in _var_dsai_tag)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_session_priority)
    {
        [_var_session_priority beforeEncode];
        [arr addObject:_var_session_priority];
    }
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_requested_nodes)
    {
        [_var_requested_nodes beforeEncode];
        [arr addObject:_var_requested_nodes];
    }
    if(_var_serving_node_indication)
    {
        [_var_serving_node_indication beforeEncode];
        [arr addObject:_var_serving_node_indication];
    }
    if(_var_pre_paging_supported)
    {
        [_var_pre_paging_supported beforeEncode];
        [arr addObject:_var_pre_paging_supported];
    }
    if(_var_local_time_zone_indication)
    {
        [_var_local_time_zone_indication beforeEncode];
        [arr addObject:_var_local_time_zone_indication];
    }
    if(_var_call_reference_info)
    {
        [_var_call_reference_info beforeEncode];
        [arr addObject:_var_call_reference_info];
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

    if(dict[@"wildcarded-impu"])
    {
        _var_wildcarded_impu = [[UMDiameterAvpWildcarded_IMPU alloc]init];
        _var_wildcarded_impu.objectValue = dict[@"wildcarded-impu"];
    }

    if(dict[@"server-name"])
    {
        _var_server_name = [[UMDiameterAvpServer_Name alloc]init];
        _var_server_name.objectValue = dict[@"server-name"];
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
    if(dict[@"requested-domain"])
    {
        _var_requested_domain = [[UMDiameterAvpRequested_Domain alloc]init];
        _var_requested_domain.objectValue = dict[@"requested-domain"];
    }

    if(dict[@"current-location"])
    {
        _var_current_location = [[UMDiameterAvpCurrent_Location alloc]init];
        _var_current_location.objectValue = dict[@"current-location"];
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
    if(dict[@"session-priority"])
    {
        _var_session_priority = [[UMDiameterAvpSession_Priority alloc]init];
        _var_session_priority.objectValue = dict[@"session-priority"];
    }

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"requested-nodes"])
    {
        _var_requested_nodes = [[UMDiameterAvpRequested_Nodes alloc]init];
        _var_requested_nodes.objectValue = dict[@"requested-nodes"];
    }

    if(dict[@"serving-node-indication"])
    {
        _var_serving_node_indication = [[UMDiameterAvpServing_Node_Indication alloc]init];
        _var_serving_node_indication.objectValue = dict[@"serving-node-indication"];
    }

    if(dict[@"pre-paging-supported"])
    {
        _var_pre_paging_supported = [[UMDiameterAvpPre_paging_Supported alloc]init];
        _var_pre_paging_supported.objectValue = dict[@"pre-paging-supported"];
    }

    if(dict[@"local-time-zone-indication"])
    {
        _var_local_time_zone_indication = [[UMDiameterAvpLocal_Time_Zone_Indication alloc]init];
        _var_local_time_zone_indication.objectValue = dict[@"local-time-zone-indication"];
    }

    if(dict[@"call-reference-info"])
    {
        _var_call_reference_info = [[UMDiameterAvpCall_Reference_Info alloc]init];
        _var_call_reference_info.objectValue = dict[@"call-reference-info"];
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
    if(_var_wildcarded_impu)
    {
        dict[@"wildcarded-impu"] = _var_wildcarded_impu.objectValue;
    }
    if(_var_server_name)
    {
        dict[@"server-name"] = _var_server_name.objectValue;
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
    if(_var_requested_domain)
    {
        dict[@"requested-domain"] = _var_requested_domain.objectValue;
    }
    if(_var_current_location)
    {
        dict[@"current-location"] = _var_current_location.objectValue;
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
    if(_var_session_priority)
    {
        dict[@"session-priority"] = _var_session_priority.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_requested_nodes)
    {
        dict[@"requested-nodes"] = _var_requested_nodes.objectValue;
    }
    if(_var_serving_node_indication)
    {
        dict[@"serving-node-indication"] = _var_serving_node_indication.objectValue;
    }
    if(_var_pre_paging_supported)
    {
        dict[@"pre-paging-supported"] = _var_pre_paging_supported.objectValue;
    }
    if(_var_local_time_zone_indication)
    {
        dict[@"local-time-zone-indication"] = _var_local_time_zone_indication.objectValue;
    }
    if(_var_call_reference_info)
    {
        dict[@"call-reference-info"] = _var_call_reference_info.objectValue;
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

    [UMDiameterAvpWildcarded_IMPU appendWebDiameterParameters:s webName:@"wildcarded-impu"  comment:@"" css:@"optional"];

    [UMDiameterAvpServer_Name appendWebDiameterParameters:s webName:@"server-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpService_Indication appendWebDiameterParameters:s webName:@"service-indication[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpData_Reference appendWebDiameterParameters:s webName:@"data-reference[]"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpIdentity_Set appendWebDiameterParameters:s webName:@"identity-set[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRequested_Domain appendWebDiameterParameters:s webName:@"requested-domain"  comment:@"" css:@"optional"];

    [UMDiameterAvpCurrent_Location appendWebDiameterParameters:s webName:@"current-location"  comment:@"" css:@"optional"];

    [UMDiameterAvpDSAI_Tag appendWebDiameterParameters:s webName:@"dsai-tag[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpSession_Priority appendWebDiameterParameters:s webName:@"session-priority"  comment:@"" css:@"optional"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpRequested_Nodes appendWebDiameterParameters:s webName:@"requested-nodes"  comment:@"" css:@"optional"];

    [UMDiameterAvpServing_Node_Indication appendWebDiameterParameters:s webName:@"serving-node-indication"  comment:@"" css:@"optional"];

    [UMDiameterAvpPre_paging_Supported appendWebDiameterParameters:s webName:@"pre-paging-supported"  comment:@"" css:@"optional"];

    [UMDiameterAvpLocal_Time_Zone_Indication appendWebDiameterParameters:s webName:@"local-time-zone-indication"  comment:@"" css:@"optional"];

    [UMDiameterAvpCall_Reference_Info appendWebDiameterParameters:s webName:@"call-reference-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpOC_Supported_Features appendWebDiameterParameters:s webName:@"oc-supported-features"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record[]"  comment:@"" css:@"optional"];

}

@end

