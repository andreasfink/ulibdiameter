//
//  UMDiameterPacketACA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.355000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketACA.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpAccounting_Record_Type.h"
#import "UMDiameterAvpAccounting_Record_Number.h"
#import "UMDiameterAvpAcct_Application_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpAccounting_Sub_Session_Id.h"
#import "UMDiameterAvpAcct_Session_Id.h"
#import "UMDiameterAvpAcct_Multi_Session_Id.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpError_Reporting_Host.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpAcct_Interim_Interval.h"
#import "UMDiameterAvpAccounting_Realtime_Required.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpEvent_Timestamp.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketACA

- (UMDiameterPacketACA *)initWithString:(NSString *)s
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
    self.commandCode = 271;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_session_id)
    {
        [arr addObject:_session_id]
    }
    if(_result_code)
    {
        [arr addObject:_result_code]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_accounting_record_type)
    {
        [arr addObject:_accounting_record_type]
    }
    if(_accounting_record_number)
    {
        [arr addObject:_accounting_record_number]
    }
    if(_acct_application_id)
    {
        [arr addObject:_acct_application_id]
    }
    if(_vendor_specific_application_id)
    {
        [arr addObject:_vendor_specific_application_id]
    }
    if(_user_name)
    {
        [arr addObject:_user_name]
    }
    if(_accounting_sub_session_id)
    {
        [arr addObject:_accounting_sub_session_id]
    }
    if(_acct_session_id)
    {
        [arr addObject:_acct_session_id]
    }
    if(_acct_multi_session_id)
    {
        [arr addObject:_acct_multi_session_id]
    }
    if(_error_message)
    {
        [arr addObject:_error_message]
    }
    if(_error_reporting_host)
    {
        [arr addObject:_error_reporting_host]
    }
    if(_failed_avp)
    {
        [arr addObject:_failed_avp]
    }
    if(_acct_interim_interval)
    {
        [arr addObject:_acct_interim_interval]
    }
    if(_accounting_realtime_required)
    {
        [arr addObject:_accounting_realtime_required]
    }
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
    }
    if(_event_timestamp)
    {
        [arr addObject:_event_timestamp]
    }
    if(_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _proxy_info)
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

