//
//  UMDiameterPacketAA_Mobile_Node_Request.h
//  ulibdiameter
//
//  Created by afink on 2019-06-29 22:18:00.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpSession_ID;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpUser_Name;
@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpMIP_Reg_Request;
@class UMDiameterAvpMIP_MN_AAA_Auth;
@class UMDiameterAvpAcct_Multi_Session_Id;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpMIP_Mobile_Node_Address;
@class UMDiameterAvpMIP_Home_Agent_Address;
@class UMDiameterAvpMIP_Feature_Vector;
@class UMDiameterAvpMIP_Originating_Foreign_AAA;
@class UMDiameterAvpAuthorization_Lifetime;
@class UMDiameterAvpAuth_Session_State;
@class UMDiameterAvpMIP_FA_Challenge;
@class UMDiameterAvpMIP_Candidate_Home_Agent_Host;
@class UMDiameterAvpMIP_Home_Agent_Host;
@class UMDiameterAvpMIP_HA_to_FA_SPI;
@class UMDiameterAvpProxy_Info;
@class UMDiameterAvpRoute_Record;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketAA_Mobile_Node_Request : UMDiameterPacket
{
    UMDiameterAvpSession_ID    *_session_id;
    UMDiameterAvpAuth_Application_Id    *_auth_application_id;
    UMDiameterAvpUser_Name    *_user_name;
    UMDiameterAvpDestination_Realm    *_destination_realm;
    UMDiameterAvpOrigin_Host    *_origin_host;
    UMDiameterAvpOrigin_Realm    *_origin_realm;
    UMDiameterAvpMIP_Reg_Request    *_mip_reg_request;
    UMDiameterAvpMIP_MN_AAA_Auth    *_mip_mn_aaa_auth;
    UMDiameterAvpAcct_Multi_Session_Id    *_acct_multi_session_id;
    UMDiameterAvpDestination_Host    *_destination_host;
    UMDiameterAvpOrigin_State_Id    *_origin_state_id;
    UMDiameterAvpMIP_Mobile_Node_Address    *_mip_mobile_node_address;
    UMDiameterAvpMIP_Home_Agent_Address    *_mip_home_agent_address;
    UMDiameterAvpMIP_Feature_Vector    *_mip_feature_vector;
    UMDiameterAvpMIP_Originating_Foreign_AAA    *_mip_originating_foreign_aaa;
    UMDiameterAvpAuthorization_Lifetime    *_authorization_lifetime;
    UMDiameterAvpAuth_Session_State    *_auth_session_state;
    UMDiameterAvpMIP_FA_Challenge    *_mip_fa_challenge;
    UMDiameterAvpMIP_Candidate_Home_Agent_Host    *_mip_candidate_home_agent_host;
    UMDiameterAvpMIP_Home_Agent_Host    *_mip_home_agent_host;
    UMDiameterAvpMIP_HA_to_FA_SPI    *_mip_ha_to_fa_spi;
    NSArray<UMDiameterAvpProxy_Info *>    *_proxy_info;
    NSArray<UMDiameterAvpRoute_Record *>    *_route_record;
    NSArray<UMDiameterAvpAVP *>    *_avp;
}

@property(readwrite,strong,atomic)    UMDiameterAvpSession_ID    *session_id;
@property(readwrite,strong,atomic)    UMDiameterAvpAuth_Application_Id    *auth_application_id;
@property(readwrite,strong,atomic)    UMDiameterAvpUser_Name    *user_name;
@property(readwrite,strong,atomic)    UMDiameterAvpDestination_Realm    *destination_realm;
@property(readwrite,strong,atomic)    UMDiameterAvpOrigin_Host    *origin_host;
@property(readwrite,strong,atomic)    UMDiameterAvpOrigin_Realm    *origin_realm;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Reg_Request    *mip_reg_request;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_MN_AAA_Auth    *mip_mn_aaa_auth;
@property(readwrite,strong,atomic)    UMDiameterAvpAcct_Multi_Session_Id    *acct_multi_session_id;
@property(readwrite,strong,atomic)    UMDiameterAvpDestination_Host    *destination_host;
@property(readwrite,strong,atomic)    UMDiameterAvpOrigin_State_Id    *origin_state_id;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Mobile_Node_Address    *mip_mobile_node_address;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Home_Agent_Address    *mip_home_agent_address;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Feature_Vector    *mip_feature_vector;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Originating_Foreign_AAA    *mip_originating_foreign_aaa;
@property(readwrite,strong,atomic)    UMDiameterAvpAuthorization_Lifetime    *authorization_lifetime;
@property(readwrite,strong,atomic)    UMDiameterAvpAuth_Session_State    *auth_session_state;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_FA_Challenge    *mip_fa_challenge;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Candidate_Home_Agent_Host    *mip_candidate_home_agent_host;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_Home_Agent_Host    *mip_home_agent_host;
@property(readwrite,strong,atomic)    UMDiameterAvpMIP_HA_to_FA_SPI    *mip_ha_to_fa_spi;
@property(readwrite,strong,atomic)    NSArray<UMDiameterAvpProxy_Info *>    *proxy_info;
@property(readwrite,strong,atomic)    NSArray<UMDiameterAvpRoute_Record *>    *route_record;
@property(readwrite,strong,atomic)    NSArray<UMDiameterAvpAVP *>    *avp;

@end

