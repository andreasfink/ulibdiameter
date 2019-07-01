
//
//  UMDiameterPacketAA_Mobile_Node_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-06-29 22:18:00.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketAA_Mobile_Node_Request.h"
#import "UMDiameterAvpSessionID.h"
#import "UMDiameterPacketAuth_Application_Id.h"
#import "UMDiameterPacketUser_Name.h"
#import "UMDiameterPacketDestination_Realm.h"
#import "UMDiameterPacketOrigin_Host.h"
#import "UMDiameterPacketOrigin_Realm.h"
#import "UMDiameterPacketMIP_Reg_Request.h"
#import "UMDiameterPacketMIP_MN_AAA_Auth.h"
#import "UMDiameterPacketAcct_Multi_Session_Id.h"
#import "UMDiameterPacketDestination_Host.h"
#import "UMDiameterPacketOrigin_State_Id.h"
#import "UMDiameterPacketMIP_Mobile_Node_Address.h"
#import "UMDiameterPacketMIP_Home_Agent_Address.h"
#import "UMDiameterPacketMIP_Feature_Vector.h"
#import "UMDiameterPacketMIP_Originating_Foreign_AAA.h"
#import "UMDiameterPacketAuthorization_Lifetime.h"
#import "UMDiameterPacketAuth_Session_State.h"
#import "UMDiameterPacketMIP_FA_Challenge.h"
#import "UMDiameterPacketMIP_Candidate_Home_Agent_Host.h"
#import "UMDiameterPacketMIP_Home_Agent_Host.h"
#import "UMDiameterPacketMIP_HA_to_FA_SPI.h"
#import "UMDiameterPacketProxy_Info.h"
#import "UMDiameterPacketRoute_Record.h"
#import "UMDiameterPacketAVP.h"

@implementation UMDiameterPacketAA_Mobile_Node_Request

- (UMDiameterPacketAA_Mobile_Node_Request *)initWithString:(NSString *)s
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
    self.commandCode = 260;
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
    if(_auth_application_id)
    {
        [arr addObject:_auth_application_id]
    }
    if(_user_name)
    {
        [arr addObject:_user_name]
    }
    if(_destination_realm)
    {
        [arr addObject:_destination_realm]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_mip_reg_request)
    {
        [arr addObject:_mip_reg_request]
    }
    if(_mip_mn_aaa_auth)
    {
        [arr addObject:_mip_mn_aaa_auth]
    }
    if(_acct_multi_session_id)
    {
        [arr addObject:_acct_multi_session_id]
    }
    if(_destination_host)
    {
        [arr addObject:_destination_host]
    }
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
    }
    if(_mip_mobile_node_address)
    {
        [arr addObject:_mip_mobile_node_address]
    }
    if(_mip_home_agent_address)
    {
        [arr addObject:_mip_home_agent_address]
    }
    if(_mip_feature_vector)
    {
        [arr addObject:_mip_feature_vector]
    }
    if(_mip_originating_foreign_aaa)
    {
        [arr addObject:_mip_originating_foreign_aaa]
    }
    if(_authorization_lifetime)
    {
        [arr addObject:_authorization_lifetime]
    }
    if(_auth_session_state)
    {
        [arr addObject:_auth_session_state]
    }
    if(_mip_fa_challenge)
    {
        [arr addObject:_mip_fa_challenge]
    }
    if(_mip_candidate_home_agent_host)
    {
        [arr addObject:_mip_candidate_home_agent_host]
    }
    if(_mip_home_agent_host)
    {
        [arr addObject:_mip_home_agent_host]
    }
    if(_mip_ha_to_fa_spi)
    {
        [arr addObject:_mip_ha_to_fa_spi]
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
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:avps];
}


@end
