//
//  UMDiameterPacketNotify_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:59:07.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketNotify_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpDRMP.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpAlert_Reason.h"
#import "UMDiameterAvpUE_SRVCC_Capability.h"
#import "UMDiameterAvpNOR_Flags.h"
#import "UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h"
#import "UMDiameterAvpMaximum_UE_Availability_Time.h"
#import "UMDiameterAvpMonitoring_Event_Config_Status.h"
#import "UMDiameterAvpEmergency_Services.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketNotify_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 323;
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
    if(_varvendor_specific_application_id)
    {
        [arr addObject:_varvendor_specific_application_id];
    }
    if(_vardrmp)
    {
        [arr addObject:_vardrmp];
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
    if(_varterminal_information)
    {
        [arr addObject:_varterminal_information];
    }
    if(_varmip6_agent_info)
    {
        [arr addObject:_varmip6_agent_info];
    }
    if(_varvisited_network_identifier)
    {
        [arr addObject:_varvisited_network_identifier];
    }
    if(_varcontext_identifier)
    {
        [arr addObject:_varcontext_identifier];
    }
    if(_varservice_selection)
    {
        [arr addObject:_varservice_selection];
    }
    if(_varalert_reason)
    {
        [arr addObject:_varalert_reason];
    }
    if(_varue_srvcc_capability)
    {
        [arr addObject:_varue_srvcc_capability];
    }
    if(_varnor_flags)
    {
        [arr addObject:_varnor_flags];
    }
    if(_varhomogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [arr addObject:_varhomogeneous_support_of_ims_voice_over_ps_sessions];
    }
    if(_varmaximum_ue_availability_time)
    {
        [arr addObject:_varmaximum_ue_availability_time];
    }
    if(_varmonitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _varmonitoring_event_config_status)
        {
            [arr addObject:o];
        }
    }
    if(_varemergency_services)
    {
        [arr addObject:_varemergency_services];
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

