//
//  UMDiameterPacket3GPP_SRR.h
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP.h"

@interface UMDiameterPacket3GPP_SRR : UMDiameterPacket3GPP

{
    NSString *_drmp;
    NSString *_vendor_specific_application_id;
    NSString *_auth_session_state;
    /*
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_origin_host;
    NSString *_origin_realm;
     */
    NSString *_msisdn;
    NSString *_user_name;
    NSString *_smsmi_correlation_id;
    NSArray  *_supported_features;
    NSString *_sc_address;
    NSString *_sm_rp_mti;
    NSString *_sm_rp_smea;
    NSString *_srr_flags;
    NSString *_sm_delivery_not_indended;
    /* additional AVPS */
    /* proxy info */
    /* route record */
}

@property(readwrite,strong,atomic)  NSString *drmp;
@property(readwrite,strong,atomic)  NSString *vendor_specific_application_id;
@property(readwrite,strong,atomic)  NSString *auth_session_state;
@property(readwrite,strong,atomic)  NSString *msisdn;
@property(readwrite,strong,atomic)  NSString *user_name;
@property(readwrite,strong,atomic)  NSString *smsmi_correlation_id;
@property(readwrite,strong,atomic)  NSArray  *supported_features;
@property(readwrite,strong,atomic)  NSString *sc_address;
@property(readwrite,strong,atomic)  NSString *sm_rp_mti;
@property(readwrite,strong,atomic)  NSString *sm_rp_smea;
@property(readwrite,strong,atomic)  NSString *srr_flags;
@property(readwrite,strong,atomic)  NSString *sm_delivery_not_indended;

@end

