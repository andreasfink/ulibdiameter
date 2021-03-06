//
//  UMDiameterPacketACR.m
//  ulibdiameter
//
//  Created by afink on 2021-03-23 23:12:20.057973
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketACR.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpAccounting_Record_Type.h"
#import "UMDiameterAvpAccounting_Record_Number.h"
#import "UMDiameterAvpAcct_Application_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpAccounting_Sub_Session_Id.h"
#import "UMDiameterAvpAcct_Session_Id.h"
#import "UMDiameterAvpAcct_Multi_Session_Id.h"
#import "UMDiameterAvpAcct_Interim_Interval.h"
#import "UMDiameterAvpAccounting_Realtime_Required.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpEvent_Timestamp.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketACR


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 271;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = 0;
}

+ (uint32_t)commandCode
{
    return 271;
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
    if(_var_accounting_record_type)
    {
        [_var_accounting_record_type beforeEncode];
        [arr addObject:_var_accounting_record_type];
    }
    if(_var_accounting_record_number)
    {
        [_var_accounting_record_number beforeEncode];
        [arr addObject:_var_accounting_record_number];
    }
    if(_var_acct_application_id)
    {
        [_var_acct_application_id beforeEncode];
        [arr addObject:_var_acct_application_id];
    }
    if(_var_vendor_specific_application_id)
    {
        [_var_vendor_specific_application_id beforeEncode];
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_destination_host)
    {
        [_var_destination_host beforeEncode];
        [arr addObject:_var_destination_host];
    }
    if(_var_accounting_sub_session_id)
    {
        [_var_accounting_sub_session_id beforeEncode];
        [arr addObject:_var_accounting_sub_session_id];
    }
    if(_var_acct_session_id)
    {
        [_var_acct_session_id beforeEncode];
        [arr addObject:_var_acct_session_id];
    }
    if(_var_acct_multi_session_id)
    {
        [_var_acct_multi_session_id beforeEncode];
        [arr addObject:_var_acct_multi_session_id];
    }
    if(_var_acct_interim_interval)
    {
        [_var_acct_interim_interval beforeEncode];
        [arr addObject:_var_acct_interim_interval];
    }
    if(_var_accounting_realtime_required)
    {
        [_var_accounting_realtime_required beforeEncode];
        [arr addObject:_var_accounting_realtime_required];
    }
    if(_var_origin_state_id)
    {
        [_var_origin_state_id beforeEncode];
        [arr addObject:_var_origin_state_id];
    }
    if(_var_event_timestamp)
    {
        [_var_event_timestamp beforeEncode];
        [arr addObject:_var_event_timestamp];
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

    if(dict[@"accounting-record-type"])
    {
        _var_accounting_record_type = [[UMDiameterAvpAccounting_Record_Type alloc]init];
        _var_accounting_record_type.objectValue = dict[@"accounting-record-type"];
    }

    if(dict[@"accounting-record-number"])
    {
        _var_accounting_record_number = [[UMDiameterAvpAccounting_Record_Number alloc]init];
        _var_accounting_record_number.objectValue = dict[@"accounting-record-number"];
    }

    if(dict[@"acct-application-id"])
    {
        _var_acct_application_id = [[UMDiameterAvpAcct_Application_Id alloc]init];
        _var_acct_application_id.objectValue = dict[@"acct-application-id"];
    }

    if(dict[@"vendor-specific-application-id"])
    {
        _var_vendor_specific_application_id = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
        _var_vendor_specific_application_id.objectValue = dict[@"vendor-specific-application-id"];
    }

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"destination-host"])
    {
        _var_destination_host = [[UMDiameterAvpDestination_Host alloc]init];
        _var_destination_host.objectValue = dict[@"destination-host"];
    }

    if(dict[@"accounting-sub-session-id"])
    {
        _var_accounting_sub_session_id = [[UMDiameterAvpAccounting_Sub_Session_Id alloc]init];
        _var_accounting_sub_session_id.objectValue = dict[@"accounting-sub-session-id"];
    }

    if(dict[@"acct-session-id"])
    {
        _var_acct_session_id = [[UMDiameterAvpAcct_Session_Id alloc]init];
        _var_acct_session_id.objectValue = dict[@"acct-session-id"];
    }

    if(dict[@"acct-multi-session-id"])
    {
        _var_acct_multi_session_id = [[UMDiameterAvpAcct_Multi_Session_Id alloc]init];
        _var_acct_multi_session_id.objectValue = dict[@"acct-multi-session-id"];
    }

    if(dict[@"acct-interim-interval"])
    {
        _var_acct_interim_interval = [[UMDiameterAvpAcct_Interim_Interval alloc]init];
        _var_acct_interim_interval.objectValue = dict[@"acct-interim-interval"];
    }

    if(dict[@"accounting-realtime-required"])
    {
        _var_accounting_realtime_required = [[UMDiameterAvpAccounting_Realtime_Required alloc]init];
        _var_accounting_realtime_required.objectValue = dict[@"accounting-realtime-required"];
    }

    if(dict[@"origin-state-id"])
    {
        _var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        _var_origin_state_id.objectValue = dict[@"origin-state-id"];
    }

    if(dict[@"event-timestamp"])
    {
        _var_event_timestamp = [[UMDiameterAvpEvent_Timestamp alloc]init];
        _var_event_timestamp.objectValue = dict[@"event-timestamp"];
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
    if(_var_accounting_record_type)
    {
        dict[@"accounting-record-type"] = _var_accounting_record_type.objectValue;
    }
    if(_var_accounting_record_number)
    {
        dict[@"accounting-record-number"] = _var_accounting_record_number.objectValue;
    }
    if(_var_acct_application_id)
    {
        dict[@"acct-application-id"] = _var_acct_application_id.objectValue;
    }
    if(_var_vendor_specific_application_id)
    {
        dict[@"vendor-specific-application-id"] = _var_vendor_specific_application_id.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_destination_host)
    {
        dict[@"destination-host"] = _var_destination_host.objectValue;
    }
    if(_var_accounting_sub_session_id)
    {
        dict[@"accounting-sub-session-id"] = _var_accounting_sub_session_id.objectValue;
    }
    if(_var_acct_session_id)
    {
        dict[@"acct-session-id"] = _var_acct_session_id.objectValue;
    }
    if(_var_acct_multi_session_id)
    {
        dict[@"acct-multi-session-id"] = _var_acct_multi_session_id.objectValue;
    }
    if(_var_acct_interim_interval)
    {
        dict[@"acct-interim-interval"] = _var_acct_interim_interval.objectValue;
    }
    if(_var_accounting_realtime_required)
    {
        dict[@"accounting-realtime-required"] = _var_accounting_realtime_required.objectValue;
    }
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
    }
    if(_var_event_timestamp)
    {
        dict[@"event-timestamp"] = _var_event_timestamp.objectValue;
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

    [UMDiameterAvpAccounting_Record_Type appendWebDiameterParameters:s webName:@"accounting-record-type"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpAccounting_Record_Number appendWebDiameterParameters:s webName:@"accounting-record-number"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpAcct_Application_Id appendWebDiameterParameters:s webName:@"acct-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];

    [UMDiameterAvpAccounting_Sub_Session_Id appendWebDiameterParameters:s webName:@"accounting-sub-session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAcct_Session_Id appendWebDiameterParameters:s webName:@"acct-session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAcct_Multi_Session_Id appendWebDiameterParameters:s webName:@"acct-multi-session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAcct_Interim_Interval appendWebDiameterParameters:s webName:@"acct-interim-interval"  comment:@"" css:@"optional"];

    [UMDiameterAvpAccounting_Realtime_Required appendWebDiameterParameters:s webName:@"accounting-realtime-required"  comment:@"" css:@"optional"];

    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpEvent_Timestamp appendWebDiameterParameters:s webName:@"event-timestamp"  comment:@"" css:@"optional"];

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
        else if(avp.avpCode == [UMDiameterAvpDestination_Realm avpCode])
        {
            UMDiameterAvpDestination_Realm *avp2 = [[UMDiameterAvpDestination_Realm alloc]initWithAvp:avp];
            _var_destination_realm = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAccounting_Record_Type avpCode])
        {
            UMDiameterAvpAccounting_Record_Type *avp2 = [[UMDiameterAvpAccounting_Record_Type alloc]initWithAvp:avp];
            _var_accounting_record_type = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAccounting_Record_Number avpCode])
        {
            UMDiameterAvpAccounting_Record_Number *avp2 = [[UMDiameterAvpAccounting_Record_Number alloc]initWithAvp:avp];
            _var_accounting_record_number = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Application_Id avpCode])
        {
            UMDiameterAvpAcct_Application_Id *avp2 = [[UMDiameterAvpAcct_Application_Id alloc]initWithAvp:avp];
            _var_acct_application_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            _var_vendor_specific_application_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpUser_Name avpCode])
        {
            UMDiameterAvpUser_Name *avp2 = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            _var_user_name = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_Host avpCode])
        {
            UMDiameterAvpDestination_Host *avp2 = [[UMDiameterAvpDestination_Host alloc]initWithAvp:avp];
            _var_destination_host = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAccounting_Sub_Session_Id avpCode])
        {
            UMDiameterAvpAccounting_Sub_Session_Id *avp2 = [[UMDiameterAvpAccounting_Sub_Session_Id alloc]initWithAvp:avp];
            _var_accounting_sub_session_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Session_Id avpCode])
        {
            UMDiameterAvpAcct_Session_Id *avp2 = [[UMDiameterAvpAcct_Session_Id alloc]initWithAvp:avp];
            _var_acct_session_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Multi_Session_Id avpCode])
        {
            UMDiameterAvpAcct_Multi_Session_Id *avp2 = [[UMDiameterAvpAcct_Multi_Session_Id alloc]initWithAvp:avp];
            _var_acct_multi_session_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Interim_Interval avpCode])
        {
            UMDiameterAvpAcct_Interim_Interval *avp2 = [[UMDiameterAvpAcct_Interim_Interval alloc]initWithAvp:avp];
            _var_acct_interim_interval = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpAccounting_Realtime_Required avpCode])
        {
            UMDiameterAvpAccounting_Realtime_Required *avp2 = [[UMDiameterAvpAccounting_Realtime_Required alloc]initWithAvp:avp];
            _var_accounting_realtime_required = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpOrigin_State_Id avpCode])
        {
            UMDiameterAvpOrigin_State_Id *avp2 = [[UMDiameterAvpOrigin_State_Id alloc]initWithAvp:avp];
            _var_origin_state_id = avp2;
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Timestamp avpCode])
        {
            UMDiameterAvpEvent_Timestamp *avp2 = [[UMDiameterAvpEvent_Timestamp alloc]initWithAvp:avp];
            _var_event_timestamp = avp2;
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
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	dict[@"Destination-Realm"] = [_var_destination_realm objectValue];
	dict[@"Accounting-Record-Type"] = [_var_accounting_record_type objectValue];
	dict[@"Accounting-Record-Number"] = [_var_accounting_record_number objectValue];
	dict[@"Acct-Application-Id"] = [_var_acct_application_id objectValue];
	dict[@"Vendor-Specific-Application-Id"] = [_var_vendor_specific_application_id objectValue];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"Destination-Host"] = [_var_destination_host objectValue];
	dict[@"Accounting-Sub-Session-Id"] = [_var_accounting_sub_session_id objectValue];
	dict[@"Acct-Session-Id"] = [_var_acct_session_id objectValue];
	dict[@"Acct-Multi-Session-Id"] = [_var_acct_multi_session_id objectValue];
	dict[@"Acct-Interim-Interval"] = [_var_acct_interim_interval objectValue];
	dict[@"Accounting-Realtime-Required"] = [_var_accounting_realtime_required objectValue];
	dict[@"Origin-State-Id"] = [_var_origin_state_id objectValue];
	dict[@"Event-Timestamp"] = [_var_event_timestamp objectValue];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccounting_Record_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccounting_Record_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Application_Id definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccounting_Sub_Session_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Session_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Multi_Session_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Interim_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccounting_Realtime_Required definition];
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
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEvent_Timestamp definition];
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
    commandDef[@"command-name"] = @"ACR";
    commandDef[@"web-name"] = @"acr";
    commandDef[@"command-number"] = @(271);
    commandDef[@"application-id"] = @(0);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(YES);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

