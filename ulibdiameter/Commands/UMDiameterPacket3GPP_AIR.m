//
//  UMDiameterPacket3GPP_AIR.m
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_AIR.h"
#import "UMDiameterAvp3GPP_MSISDN.h"
#import "UMDiameterAvpUserName.h"
#import "UMDiameterAvpSessionId.h"
#import "UMDiameterAvp3GPP_Visited_PLMN_ID.h"
#import "UMDiameterAvp3GPP_AIR_Flags.h"
@implementation UMDiameterPacket3GPP_AIR


-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode =  UMDiameterCommandCode_3GPP_Authentication_Information;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];
    // Release 15 Page 40 3GPP TS 29.272 V15.2.0 (2017-12)
    // Table 5.2.3.1.1/1: Authentication Information Request

    // [ User-Name ] = imsi
    // This information element shall contain the user IMSI, formatted according to 3GPP TS 23.003 [3], clause 2.2.

    if(_imsi.length > 0)
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
