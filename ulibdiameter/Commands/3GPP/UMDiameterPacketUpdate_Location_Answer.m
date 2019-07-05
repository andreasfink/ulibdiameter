//
//  UMDiameterPacketUpdate_Location_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.825000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketUpdate_Location_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpError_Diagnostic.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpOC_OLR.h"
#import "UMDiameterAvpLoad.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpULA_Flags.h"
#import "UMDiameterAvpSubscription_Data.h"
#import "UMDiameterAvpReset_ID.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketUpdate_Location_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 316;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
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
    if(_varresult_code)
    {
        [arr addObject:_varresult_code];
    }
    if(_varexperimental_result)
    {
        [arr addObject:_varexperimental_result];
    }
    if(_varerror_diagnostic)
    {
        [arr addObject:_varerror_diagnostic];
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
    if(_varoc_supported_features)
    {
        [arr addObject:_varoc_supported_features];
    }
    if(_varoc_olr)
    {
        [arr addObject:_varoc_olr];
    }
    if(_varload.count > 0)
    {
        for(UMDiameterAvpLoad *o in _varload)
        {
            [arr addObject:o];
        }
    }
    if(_varsupported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _varsupported_features)
        {
            [arr addObject:o];
        }
    }
    if(_varula_flags)
    {
        [arr addObject:_varula_flags];
    }
    if(_varsubscription_data)
    {
        [arr addObject:_varsubscription_data];
    }
    if(_varreset_id.count > 0)
    {
        for(UMDiameterAvpReset_ID *o in _varreset_id)
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
    if(_varfailed_avp)
    {
        [arr addObject:_varfailed_avp];
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

