//
//  UMDiameterPacket3GPP_SRA.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_SRA.h"
#import "UMDiameterAvpAll.h"
/*
 < Send-Routing-info-for-SM-Answer > ::= < Diameter Header: 8388647, PXY, 16777312 > < Session-Id >
 [ DRMP ]
 [ Vendor-Specific-Application-Id ] [ Result-Code ]
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

@implementation UMDiameterPacket3GPP_SRA


-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode =  UMDiameterCommandCode_3GPP_TS_29_338_SR;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{

    /*
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
*/
    [super beforeEncode];

    if(_drmp.length  > 0)
    {
        UMDiameterAvpDRMP *avp = [[UMDiameterAvpDRMP alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _drmp;
        [self appendAvp:avp];
    }
    NSArray *vids = [_vendor_specific_application_id componentsSeparatedByString:@","];
    if(vids.count > 0)
    {
        UMDiameterAvpVendorSpecificApplicationId *avp = [[UMDiameterAvpVendorSpecificApplicationId alloc]init];
        [avp setFlagMandatory:YES];
        NSMutableArray *b = [[NSMutableArray alloc]init];

        for(NSString *vid in vids)
        {
            UMDiameterAvpVendorId *avp_v = [[UMDiameterAvpVendorId alloc]init];
            avp_v.stringValue = vid;
            [b addObject:avp_v];
        }
        [avp setArray:b];
        [self appendAvp:avp];
    }
    if(_result_code.length > 0)
    {
        UMDiameterAvpResultCode *avp = [[UMDiameterAvpResultCode alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _result_code;
        [self appendAvp:avp];
    }


    NSArray *ers = [_experimental_result componentsSeparatedByString:@","];
    if(ers.count > 0)
    {
        UMDiameterAvpExperimentalResult *avp = [[UMDiameterAvpExperimentalResult alloc]init];
        [avp setFlagMandatory:YES];

        NSMutableArray *b = [[NSMutableArray alloc]init];
        for(NSString *er in ers)
        {
            UMDiameterAvpExperimentalResultCode *avp_e = [[UMDiameterAvpExperimentalResultCode alloc]init];
            avp_e.stringValue = er;
            [b addObject:avp_e];
        }
        [avp setArray:b];
        [self appendAvp:avp];
    }
    if(_auth_session_state.length > 0)
    {
        UMDiameterAvpAuthSessionState *avp = [[UMDiameterAvpAuthSessionState alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _auth_session_state;
        [self appendAvp:avp];
    }


    if(_origin_host.length > 0)
    {
        UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _origin_host;
        [self appendAvp:avp];
    }


    if(_origin_realm.length > 0)
    {
        UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _origin_realm;
        [self appendAvp:avp];
    }

    if(_user_name.length > 0)
    {
        UMDiameterAvpUserName *avp = [[UMDiameterAvpUserName alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _user_name;
        [self appendAvp:avp];
    }


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

    if(_serving_node.length > 0)
    {
        UMDiameterAvp3GPP_SMSMI_Correlation_ID *avp = [[UMDiameterAvp3GPP_Serving_Node alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _smsmi_correlation_id;
        [self appendAvp:avp];
    }
    if(_supported_features.count > 0)
    {
        UMDiameterAvpCode3GPP_Supported_Features *avp = [[UMDiameterAvpCode3GPP_Supported_Features alloc]init];
        [avp setFlagMandatory:YES];
        /*
         avp.value = _supported_features;
         */
        [self appendAvp:avp];

    }
    if(_sc_address.length > 0)
    {
    }
    // [ SC-Address ]
    // [ SM-RP-MTI ]
    // [ SM-RP-SMEA ]
    // [ SRR-Flags ]
    // [ SM-Delivery-Not-Intended ]
    // *[ AVP ]
    // *[ Proxy-Info ]
    // *[ Route-Record ]
    /*
     NSString *_smsmi_correlation_id;
     NSArray  *_supported_features;
     NSString *_sc_address;
     NSString *_sm_rp_mti;
     NSString *_sm_rp_smea;
     NSString *_srr_flags;
     NSString *_sm_delivery_not_indended;
     NSArray  *_custom_avps;
     NSString *_proxy_info;
     NSArray  *_route_record;
     */

}

@end
