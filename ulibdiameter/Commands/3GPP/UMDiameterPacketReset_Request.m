//
//  UMDiameterPacketReset_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:59:07.268000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketReset_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpUser_Id.h"
#import "UMDiameterAvpReset_ID.h"
#import "UMDiameterAvpSubscription_Data.h"
#import "UMDiameterAvpSubscription_Data_Deletion.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketReset_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 322;
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
    if(_vardrmp)
    {
        [arr addObject:_vardrmp];
    }
    if(_varvendor_specific_application_id)
    {
        [arr addObject:_varvendor_specific_application_id];
    }
    if(_varauth_session_state)
    {
        [arr addObject:_varauth_session_state];
    }
    if(_varorigin_host)
    {
        [arr addObject:_varorigin_host];
    }
    if(_varorigin_realm)
    {
        [arr addObject:_varorigin_realm];
    }
    if(_vardestination_host)
    {
        [arr addObject:_vardestination_host];
    }
    if(_vardestination_realm)
    {
        [arr addObject:_vardestination_realm];
    }
    if(_varsupported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _varsupported_features)
        {
            [arr addObject:o];
        }
    }
    if(_varuser_id.count > 0)
    {
        for(UMDiameterAvpUser_Id *o in _varuser_id)
        {
            [arr addObject:o];
        }
    }
    if(_varreset_id.count > 0)
    {
        for(UMDiameterAvpReset_ID *o in _varreset_id)
        {
            [arr addObject:o];
        }
    }
    if(_varsubscription_data)
    {
        [arr addObject:_varsubscription_data];
    }
    if(_varsubscription_data_deletion)
    {
        [arr addObject:_varsubscription_data_deletion];
    }
    if(_varavp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _varavp)
        {
            [arr addObject:o];
        }
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
    [self setAvps:arr];
}


@end
