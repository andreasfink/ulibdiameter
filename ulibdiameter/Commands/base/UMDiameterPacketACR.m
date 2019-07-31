//
//  UMDiameterPacketACR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:14:09.272000
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
        [arr addObject:_var_session_id];
    }
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_destination_realm)
    {
        [arr addObject:_var_destination_realm];
    }
    if(_var_accounting_record_type)
    {
        [arr addObject:_var_accounting_record_type];
    }
    if(_var_accounting_record_number)
    {
        [arr addObject:_var_accounting_record_number];
    }
    if(_var_acct_application_id)
    {
        [arr addObject:_var_acct_application_id];
    }
    if(_var_vendor_specific_application_id)
    {
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_destination_host)
    {
        [arr addObject:_var_destination_host];
    }
    if(_var_accounting_sub_session_id)
    {
        [arr addObject:_var_accounting_sub_session_id];
    }
    if(_var_acct_session_id)
    {
        [arr addObject:_var_acct_session_id];
    }
    if(_var_acct_multi_session_id)
    {
        [arr addObject:_var_acct_multi_session_id];
    }
    if(_var_acct_interim_interval)
    {
        [arr addObject:_var_acct_interim_interval];
    }
    if(_var_accounting_realtime_required)
    {
        [arr addObject:_var_accounting_realtime_required];
    }
    if(_var_origin_state_id)
    {
        [arr addObject:_var_origin_state_id];
    }
    if(_var_event_timestamp)
    {
        [arr addObject:_var_event_timestamp];
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
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
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


    [s appendString:@"<tr>\n"];
    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAccounting_Record_Type appendWebDiameterParameters:s webName:@"accounting-record-type"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAccounting_Record_Number appendWebDiameterParameters:s webName:@"accounting-record-number"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAcct_Application_Id appendWebDiameterParameters:s webName:@"acct-application-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAccounting_Sub_Session_Id appendWebDiameterParameters:s webName:@"accounting-sub-session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAcct_Session_Id appendWebDiameterParameters:s webName:@"acct-session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAcct_Multi_Session_Id appendWebDiameterParameters:s webName:@"acct-multi-session-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAcct_Interim_Interval appendWebDiameterParameters:s webName:@"acct-interim-interval"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAccounting_Realtime_Required appendWebDiameterParameters:s webName:@"accounting-realtime-required"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpEvent_Timestamp appendWebDiameterParameters:s webName:@"event-timestamp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAVP appendWebDiameterParameters:s webName:@"avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

}

@end

