//
//  UMDiameterPacketSTR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.197000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketSTR.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpTermination_Cause.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpClass.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketSTR

- (UMDiameterPacketSTR *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        if([self parseString:s]==NO)
        {
            return NULL;
        }
    }
    return self;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 275;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_session_id)
    {
        [arr addObject:_session_id]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_destination_realm)
    {
        [arr addObject:_destination_realm]
    }
    if(_auth_application_id)
    {
        [arr addObject:_auth_application_id]
    }
    if(_termination_cause)
    {
        [arr addObject:_termination_cause]
    }
    if(_user_name)
    {
        [arr addObject:_user_name]
    }
    if(_destination_host)
    {
        [arr addObject:_destination_host]
    }
    if(_class.count > 0)
    {
        for(UMDiameterAvpClass *o in _class)
        {
            [arr addObject:o]
        }
    }
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
    }
    if(_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _proxy_info)
        {
            [arr addObject:o]
        }
    }
    if(_route_record.count > 0)
    {
        for(UMDiameterAvpRoute_Record *o in _route_record)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


@end

