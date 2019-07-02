//
//  UMDiameterPacketACR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.401000
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

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_varsession_id)
    {
        [arr addObject:_varsession_id];
    }
    if(_varorigin_host)
    {
        [arr addObject:_varorigin_host];
    }
    if(_varorigin_realm)
    {
        [arr addObject:_varorigin_realm];
    }
    if(_vardestination_realm)
    {
        [arr addObject:_vardestination_realm];
    }
    if(_varaccounting_record_type)
    {
        [arr addObject:_varaccounting_record_type];
    }
    if(_varaccounting_record_number)
    {
        [arr addObject:_varaccounting_record_number];
    }
    if(_varacct_application_id)
    {
        [arr addObject:_varacct_application_id];
    }
    if(_varvendor_specific_application_id)
    {
        [arr addObject:_varvendor_specific_application_id];
    }
    if(_varuser_name)
    {
        [arr addObject:_varuser_name];
    }
    if(_vardestination_host)
    {
        [arr addObject:_vardestination_host];
    }
    if(_varaccounting_sub_session_id)
    {
        [arr addObject:_varaccounting_sub_session_id];
    }
    if(_varacct_session_id)
    {
        [arr addObject:_varacct_session_id];
    }
    if(_varacct_multi_session_id)
    {
        [arr addObject:_varacct_multi_session_id];
    }
    if(_varacct_interim_interval)
    {
        [arr addObject:_varacct_interim_interval];
    }
    if(_varaccounting_realtime_required)
    {
        [arr addObject:_varaccounting_realtime_required];
    }
    if(_varorigin_state_id)
    {
        [arr addObject:_varorigin_state_id];
    }
    if(_varevent_timestamp)
    {
        [arr addObject:_varevent_timestamp];
    }
    if(_varproxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _varproxy_info)
        {
            [arr addObject:o];
        }
    }
    if(_varroute_record.count > 0)
    {
        for(UMDiameterAvpRoute_Record *o in _varroute_record)
        {
            [arr addObject:o];
        }
    }
    if(_varavp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _varavp)
        {
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


@end

