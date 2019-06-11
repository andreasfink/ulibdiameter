//
//  UMDiameterPacket3GPP_SRR.m
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_SRR.h"

#import "UMDiameterAvpAll.h"

@implementation UMDiameterPacket3GPP_SRR

/*
3GPP TS 29.338 version 15.1.0 Release 15 Page 22 ETSI TS 129 338 V15.1.0 (2019-04)

 The Send-Routing-Info-for-SM-Request (SRR) command, indicated by the Command-Code field set to 8388647 and the "R" bit set in the Command Flags field, is sent from SMS-GMSC to HSS or SMS Router or from SMS Router to HSS.
Message Format:

 < Send-Routing-Info-for-SM-Request > ::= < Diameter Header: 8388647, REQ, PXY, 16777312 > < Session-Id >
 [ DRMP ]
 [ Vendor-Specific-Application-Id ] { Auth-Session-State }
 { Origin-Host }
 { Origin-Realm }
 [ Destination-Host ]
 { Destination-Realm }
 [ MSISDN ]
 [ User-Name ]
 [ SMSMI-Correlation-ID ]
 *[ Supported-Features ]
 [ SC-Address ]
 [ SM-RP-MTI ]
 [ SM-RP-SMEA ]
 [ SRR-Flags ]
 [ SM-Delivery-Not-Intended ]
 *[ AVP ]
 *[ Proxy-Info ]
 *[ Route-Record ]

 */
-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode =  UMDiameterCommandCode_3GPP_TS_29_338_SR;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];

    if(_session_id)
    {
        UMDiameterAvpSessionId *avp = [[UMDiameterAvpSessionId alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _session_id;
        [self appendAvp:avp];
    }
    if(_origin_host.length > 0)
    {
        // { Origin-Host }
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


    if(_destination_host.length > 0)
    {
        // { Destination-Host }
        UMDiameterAvpDestinationHost *avp = [[UMDiameterAvpDestinationHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _destination_host;
        [self appendAvp:avp];
    }
    // { Restination-Realm }
    if(_destination_realm.length > 0)
    {
        UMDiameterAvpDestinationRealm *avp = [[UMDiameterAvpDestinationRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _destination_realm;
        [self appendAvp:avp];
    }


    if(_drmp.length > 0)
    {
        UMDiameterAvpDRMP *avp = [[UMDiameterAvpDRMP alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _drmp;
        [self appendAvp:avp];
    }


    if(_msisdn.length > 0)
    {
        UMDiameterAvp3GPP_MSISDN *avp = [[UMDiameterAvp3GPP_MSISDN alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _msisdn;
        [self appendAvp:avp];
    }

    if(_user_name.length > 0)
    {
        UMDiameterAvpUserName *avp = [[UMDiameterAvpUserName alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _user_name;
        [self appendAvp:avp];
    }

    if(_smsmi_correlation_id.length > 0)
    {
        UMDiameterAvpUserName *avp = [[UMDiameterAvpUserName alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _smsmi_correlation_id;
        [self appendAvp:avp];
    }
    if(_supported_features.count > 0)
    {
        UMDiameterAvp3GPP_Supported_Features *avp = [[UMDiameterAvp3GPP_Supported_Features alloc]init];
        [avp setFlagMandatory:YES];
        /*
        avp.value = _supported_features;
         */
        [self appendAvp:avp];

    }
    if(_sc_address.length > 0)
    {
        UMDiameterAvp3GPP_SC_Address *avp = [[UMDiameterAvp3GPP_SC_Address alloc]init];
        [avp setFlagMandatory:YES];
         avp.stringValue = _sc_address;
        [self appendAvp:avp];
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
