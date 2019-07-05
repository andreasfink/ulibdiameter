//
//  UMDiameterPacketUpdate_Location_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-07-05 15:51:01.841000
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
    if(_varterminal_information)
    {
        [arr addObject:_varterminal_information];
    }
    if(_varrat_type)
    {
        [arr addObject:_varrat_type];
    }
    if(_varulr_flags)
    {
        [arr addObject:_varulr_flags];
    }
    if(_varue_srvcc_capability)
    {
        [arr addObject:_varue_srvcc_capability];
    }
    if(_varvisited_plmn_id)
    {
        [arr addObject:_varvisited_plmn_id];
    }
    if(_varsgsn_number)
    {
        [arr addObject:_varsgsn_number];
    }
    if(_varhomogeneous_support_of_ims_voice_over_ps_sessions)
    {
        [arr addObject:_varhomogeneous_support_of_ims_voice_over_ps_sessions];
    }
    if(_vargmlc_address)
    {
        [arr addObject:_vargmlc_address];
    }
    if(_varactive_apn.count > 0)
    {
        for(UMDiameterAvpActive_APN *o in _varactive_apn)
        {
            [arr addObject:o];
        }
    }
    if(_varequivalent_plmn_list)
    {
        [arr addObject:_varequivalent_plmn_list];
    }
    if(_varmme_number_for_mt_sms)
    {
        [arr addObject:_varmme_number_for_mt_sms];
    }
    if(_varsms_register_request)
    {
        [arr addObject:_varsms_register_request];
    }
    if(_varsgs_mme_identity)
    {
        [arr addObject:_varsgs_mme_identity];
    }
    if(_varcoupled_node_diameter_id)
    {
        [arr addObject:_varcoupled_node_diameter_id];
    }
    if(_varadjacent_plmns)
    {
        [arr addObject:_varadjacent_plmns];
    }
    if(_varsupported_services)
    {
        [arr addObject:_varsupported_services];
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

