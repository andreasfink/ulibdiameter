//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:59:07.177000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketInsert_Subscriber_Data_Answer.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.h"
#import "UMDiameterAvpLast_UE_Activity_Time.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpIDA_Flags.h"
#import "UMDiameterAvpEPS_User_State.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpLocal_Time_Zone.h"
#import "UMDiameterAvpSupported_Services.h"
#import "UMDiameterAvpMonitoring_Event_Report.h"
#import "UMDiameterAvpMonitoring_Event_Config_Status.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketInsert_Subscriber_Data_Answer


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 319;
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
    if(_varsupported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _varsupported_features)
        {
            [arr addObject:o];
        }
    }
    if(_varresult_code)
    {
        [arr addObject:_varresult_code];
    }
    if(_varexperimental_result)
    {
        [arr addObject:_varexperimental_result];
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
    if(_varims_voice_over_ps_sessions_supported)
    {
        [arr addObject:_varims_voice_over_ps_sessions_supported];
    }
    if(_varlast_ue_activity_time)
    {
        [arr addObject:_varlast_ue_activity_time];
    }
    if(_varrat_type)
    {
        [arr addObject:_varrat_type];
    }
    if(_varida_flags)
    {
        [arr addObject:_varida_flags];
    }
    if(_vareps_user_state)
    {
        [arr addObject:_vareps_user_state];
    }
    if(_vareps_location_information)
    {
        [arr addObject:_vareps_location_information];
    }
    if(_varlocal_time_zone)
    {
        [arr addObject:_varlocal_time_zone];
    }
    if(_varsupported_services)
    {
        [arr addObject:_varsupported_services];
    }
    if(_varmonitoring_event_report.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Report *o in _varmonitoring_event_report)
        {
            [arr addObject:o];
        }
    }
    if(_varmonitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _varmonitoring_event_config_status)
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

