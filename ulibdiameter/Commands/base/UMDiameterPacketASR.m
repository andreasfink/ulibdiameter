//
//  UMDiameterPacketASR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.467000
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
    if(_vardestination_host)
    {
        [arr addObject:_vardestination_host];
    }
    if(_varauth_application_id)
    {
        [arr addObject:_varauth_application_id];
    }
    if(_varuser_name)
    {
        [arr addObject:_varuser_name];
    }
    if(_varorigin_state_id)
    {
        [arr addObject:_varorigin_state_id];
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

