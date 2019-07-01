//
//  UMDiameterPacketDelete_Subscriber_Data_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:41.835000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketDelete_Subscriber_Data_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpDSR_Flags.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpTrace_Reference.h"
#import "UMDiameterAvpTS_Code.h"
#import "UMDiameterAvpSS_Code.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketDelete_Subscriber_Data_Request

- (UMDiameterPacketDelete_Subscriber_Data_Request *)initWithString:(NSString *)s
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
    self.commandCode = 320;
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
    if(_drmp)
    {
        [arr addObject:_drmp]
    }
    if(_vendor_specific_application_id)
    {
        [arr addObject:_vendor_specific_application_id]
    }
    if(_auth_session_state)
    {
        [arr addObject:_auth_session_state]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_destination_host)
    {
        [arr addObject:_destination_host]
    }
    if(_destination_realm)
    {
        [arr addObject:_destination_realm]
    }
    if(_user_name)
    {
        [arr addObject:_user_name]
    }
    if(_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _supported_features)
        {
            [arr addObject:o]
        }
    }
    if(_dsr_flags)
    {
        [arr addObject:_dsr_flags]
    }
    if(_scef_id)
    {
        [arr addObject:_scef_id]
    }
    if(_context_identifier.count > 0)
    {
        for(UMDiameterAvpContext_Identifier *o in _context_identifier)
        {
            [arr addObject:o]
        }
    }
    if(_trace_reference)
    {
        [arr addObject:_trace_reference]
    }
    if(_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _ts_code)
        {
            [arr addObject:o]
        }
    }
    if(_ss_code.count > 0)
    {
        for(UMDiameterAvpSS_Code *o in _ss_code)
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
    [self setAvps:arr];
}


@end

