//
//  UMDiameterPacket3GPP_SRR.m
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_SRR.h"

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
    // Release 15 Page 40 3GPP TS 29.272 V15.2.0 (2017-12)
    // Table 5.2.3.1.1/1: Authentication Information Request

    // [ User-Name ] = imsi
    // This information element shall contain the user IMSI, formatted according to 3GPP TS 23.003 [3], clause 2.2.

    if(_.length > 0)
    {
        UMDiameterAvpUserName *avp = [[UMDiameterAvpUserName alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _imsi;
        [self appendAvp:avp];
    }


    // Supported Features (See 3GPP TS 29.229 [9])
    // If present, this information element shall contain the list of features supported by the origin host.

    if(_supported_features.length > 0)
    {
    }

    // Requested E- UTRAN Authentication Info
    // (See 7.3.11)
    // This information element shall contain the information related to authentication requests for E-UTRAN.
    if(_requested_eutran_authentication_info.length > 0)
    {
        //* CREATE AVP HERE AND ADD IT */
    }
    // Requested UTRAN/GERAN Authentication Info
    // (See 7.3.12)
    // Requested- UTRAN- GERAN Authentication- Info
    if(_requested_utran_geran_authentication_info.length > 0)
    {
        //* CREATE AVP HERE AND ADD IT */
    }


    if(_visited_plmn_id.length > 0)
    {
        UMDiameterAvp3GPP_Visited_PLMN_ID *avp = [[UMDiameterAvp3GPP_Visited_PLMN_ID alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _visited_plmn_id;
        [self appendAvp:avp];
    }

    if(_air_flags.length > 0)
    {
        UMDiameterAvp3GPP_AIR_Flags *avp = [[UMDiameterAvp3GPP_AIR_Flags alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _air_flags;
        [self appendAvp:avp];
    }
}

@end
