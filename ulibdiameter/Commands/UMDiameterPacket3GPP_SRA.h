//
//  UMDiameterPacket3GPP_SRA.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"


/*
 < Send-Routing-info-for-SM-Answer > ::= < Diameter Header: 8388647, PXY, 16777312 > < Session-Id >
 [ DRMP ]
 [ Vendor-Specific-Application-Id ]
 [ Result-Code ]
 [ Experimental-Result ]

 { Auth-Session-State } { Origin-Host }
 { Origin-Realm }
 [ User-Name ]
 *[ Supported-Features ]
 [ Serving-Node ]
 [ Additional-Serving-Node ]
 [ LMSI ]
 [ User-Identifier ]
 [ MWD-Status ]
 [ MME-Absent-User-Diagnostic-SM ]
 [ MSC-Absent-User-Diagnostic-SM ]
 [ SGSN-Absent-User-Diagnostic-SM ] *[ AVP ]
 [ Failed-AVP ]
 *[ Proxy-Info ]
 *[ Route-Record ]

 */
@interface UMDiameterPacket3GPP_SRA : UMDiameterPacket
{
    NSString *_drmp;
    NSString *_vendor_specific_application_id;
    NSString *_result_code;
    NSString *_experimental_result;
    NSString *_auth_session_state;
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_user_name;
    NSArray  *_supported_features;
    NSString *_serving_node;
    NSString *_additional_serving_node;
    NSString *_lmsi;
    NSString *_user_identifier;
    NSString *_mwd_status;
    NSString *_mme_absent_user_diagnostic_sm;
    NSString *_msc_absent_user_diagnostic_sm;
    NSString *_sgsn_absent_user_diagnostic_sm;
    NSString *_failed_avp;
    NSArray *_proxy_info;
    NSArray *_route_record;
}

@property(readwrite,strong,atomic)  NSString *drmp;
@property(readwrite,strong,atomic)  NSString *vendor_specific_application_id;
@property(readwrite,strong,atomic)  NSString *result_code;
@property(readwrite,strong,atomic)  NSString *experimental_result;
@property(readwrite,strong,atomic)  NSString *auth_session_state;
@property(readwrite,strong,atomic)  NSString *origin_host;
@property(readwrite,strong,atomic)  NSString *origin_realm;
@property(readwrite,strong,atomic)  NSString *user_name;
@property(readwrite,strong,atomic)  NSArray  *supported_features;
@property(readwrite,strong,atomic)  NSString *serving_node;
@property(readwrite,strong,atomic)  NSString *additional_serving_node;
@property(readwrite,strong,atomic)  NSString *lmsi;
@property(readwrite,strong,atomic)  NSString *user_identifier;
@property(readwrite,strong,atomic)  NSString *mwd_status;
@property(readwrite,strong,atomic)  NSString *mme_absent_user_diagnostic_sm;
@property(readwrite,strong,atomic)  NSString *msc_absent_user_diagnostic_sm;
@property(readwrite,strong,atomic)  NSString *sgsn_absent_user_diagnostic_sm;
@property(readwrite,strong,atomic)  NSString *failed_avp;
@property(readwrite,strong,atomic)  NSArray *proxy_info;
@property(readwrite,strong,atomic)  NSArray *route_record;

@end

