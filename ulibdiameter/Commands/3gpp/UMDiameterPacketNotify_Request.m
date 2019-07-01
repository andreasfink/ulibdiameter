//
//  UMDiameterPacketNotify_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:42.049000
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

- (UMDiameterPacketNotify_Request *)initWithString:(NSString *)s
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
    self.commandCode = 323;
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
    if(_vendor_specific_application_id)
    {
        [arr addObject:_vendor_specific_application_id]
    }
    if(_drmp)
    {
        [arr addObject:_drmp]
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
    if(_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _supported_features)
        {
            [arr addObject:o]
        }
    }
    if(_terminal_information)
    {
        [arr addObject:_terminal_information]
    }
    if(_mip6_agent_info)
    {
        [arr addObject:_mip6_agent_info]
    }
    if(_visited_network_identifier)
    {
        [arr addObject:_visited_network_identifier]
    }
    if(_context_identifier)
    {
        [arr addObject:_context_identifier]
    }
    if(_service_selection)
    {
        [arr addObject:_service_selection]
    }
    if(_alert_reason)
    {
        [arr addObject:_alert_reason]
    }
    if(_ue_srvcc_capability)
    {
        [arr addObject:_ue_srvcc_capability]
    }
    if(_nor_flags)
    {
        [arr addObject:_nor_flags]
    }
    if(_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [arr addObject:_homogeneous_support_of_ims_voice_over_ps_sessions]
    }
    if(_maximum_ue_availability_time)
    {
        [arr addObject:_maximum_ue_availability_time]
    }
    if(_monitoring_event_config_status.count > 0)
    {
        for(UMDiameterAvpMonitoring_Event_Config_Status *o in _monitoring_event_config_status)
        {
            [arr addObject:o]
        }
    }
    if(_emergency_services)
    {
        [arr addObject:_emergency_services]
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

