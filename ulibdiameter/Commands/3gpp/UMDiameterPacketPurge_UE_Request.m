//
//  UMDiameterPacketPurge_UE_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:42.131000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketPurge_UE_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpPUR_Flags.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketPurge_UE_Request

- (UMDiameterPacketPurge_UE_Request *)initWithString:(NSString *)s
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
    self.commandCode = 321;
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
    if(_oc_supported_features)
    {
        [arr addObject:_oc_supported_features]
    }
    if(_pur_flags)
    {
        [arr addObject:_pur_flags]
    }
    if(_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _supported_features)
        {
            [arr addObject:o]
        }
    }
    if(_eps_location_information)
    {
        [arr addObject:_eps_location_information]
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

