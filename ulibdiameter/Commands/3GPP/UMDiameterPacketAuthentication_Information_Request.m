//
//  UMDiameterPacketAuthentication_Information_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.810000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketAuthentication_Information_Request.h"
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
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpRequested_EUTRAN_Authentication_Info.h"
#import "UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAIR_Flags.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketAuthentication_Information_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 318;
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
    if(_varuser_name)
    {
        [arr addObject:_varuser_name];
    }
    if(_varoc_supported_features)
    {
        [arr addObject:_varoc_supported_features];
    }
    if(_varsupported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _varsupported_features)
        {
            [arr addObject:o];
        }
    }
    if(_varrequested_eutran_authentication_info)
    {
        [arr addObject:_varrequested_eutran_authentication_info];
    }
    if(_varrequested_utran_geran_authentication_info)
    {
        [arr addObject:_varrequested_utran_geran_authentication_info];
    }
    if(_varvisited_plmn_id)
    {
        [arr addObject:_varvisited_plmn_id];
    }
    if(_varair_flags)
    {
        [arr addObject:_varair_flags];
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

