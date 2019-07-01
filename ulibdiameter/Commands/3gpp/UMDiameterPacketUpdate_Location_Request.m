//
//  UMDiameterPacketUpdate_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:38:41.701000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketUpdate_Location_Request.h"
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
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpULR_Flags.h"
#import "UMDiameterAvpUE_SRVCC_Capability.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpSGSN_Number.h"
#import "UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpActive_APN.h"
#import "UMDiameterAvpEquivalent_PLMN_List.h"
#import "UMDiameterAvpMME_Number_for_MT_SMS.h"
#import "UMDiameterAvpSMS_Register_Request.h"
#import "UMDiameterAvpSGs_MME_Identity.h"
#import "UMDiameterAvpCoupled_Node_Diameter_ID.h"
#import "UMDiameterAvpAdjacent_PLMNs.h"
#import "UMDiameterAvpSupported_Services.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketUpdate_Location_Request

- (UMDiameterPacketUpdate_Location_Request *)initWithString:(NSString *)s
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
    self.commandCode = 316;
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
    if(_rat_type)
    {
        [arr addObject:_rat_type]
    }
    if(_ulr_flags)
    {
        [arr addObject:_ulr_flags]
    }
    if(_ue_srvcc_capability)
    {
        [arr addObject:_ue_srvcc_capability]
    }
    if(_visited_plmn_id)
    {
        [arr addObject:_visited_plmn_id]
    }
    if(_sgsn_number)
    {
        [arr addObject:_sgsn_number]
    }
    if(_homogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [arr addObject:_homogeneous_support_of_ims_voice_over_ps_sessions]
    }
    if(_gmlc_address)
    {
        [arr addObject:_gmlc_address]
    }
    if(_active_apn.count > 0)
    {
        for(UMDiameterAvpActive_APN *o in _active_apn)
        {
            [arr addObject:o]
        }
    }
    if(_equivalent_plmn_list)
    {
        [arr addObject:_equivalent_plmn_list]
    }
    if(_mme_number_for_mt_sms)
    {
        [arr addObject:_mme_number_for_mt_sms]
    }
    if(_sms_register_request)
    {
        [arr addObject:_sms_register_request]
    }
    if(_sgs_mme_identity)
    {
        [arr addObject:_sgs_mme_identity]
    }
    if(_coupled_node_diameter_id)
    {
        [arr addObject:_coupled_node_diameter_id]
    }
    if(_adjacent_plmns)
    {
        [arr addObject:_adjacent_plmns]
    }
    if(_supported_services)
    {
        [arr addObject:_supported_services]
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

