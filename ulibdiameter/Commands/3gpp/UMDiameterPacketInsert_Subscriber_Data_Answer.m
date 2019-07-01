//
//  UMDiameterPacketInsert_Subscriber_Data_Answer.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:41.744000
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

- (UMDiameterPacketInsert_Subscriber_Data_Answer *)initWithString:(NSString *)s
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
    self.commandCode = 319;
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
    if(_drmp)
    {
        [arr addObject:_drmp]
    }
    if(_vendor_specific_application_id)
    {
        [arr addObject:_vendor_specific_application_id]
    }
    if(_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _supported_features)
        {
            [arr addObject:o]
        }
    }
    if(_result_code)
    {
        [arr addObject:_result_code]
    }
    if(_experimental_result)
    {
        [arr addObject:_experimental_result]
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
    if(_ims_voice_over_ps_sessions_supported)
    {
        [arr addObject:_ims_voice_over_ps_sessions_supported]
    }
    if(_last_ue_activity_time)
    {
        [arr addObject:_last_ue_activity_time]
    }
    if(_rat_type)
    {
        [arr addObject:_rat_type]
    }
    if(_ida_flags)
    {
        [arr addObject:_ida_flags]
    }
    if(_eps_user_state)
    {
        [arr addObject:_eps_user_state]
    }
    if(_eps_location_information)
    {
        [arr addObject:_eps_location_information]
    }
    if(_local_time_zone)
    {
        [arr addObject:_local_time_zone]
    }
    if(_supported_services)
    {
        [arr addObject:_supported_services]
    }
    if(_monitoring_event_report.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Report *o in _monitoring_event_report)
        {
            [arr addObject:o]
        }
    }
    if(_monitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _monitoring_event_config_status)
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
    if(_failed_avp)
    {
        [arr addObject:_failed_avp]
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

