//
//  UMDiameterAvp3GPP_SMSMI_Correlation_ID.m
//  ulibdiameter
//
//  Created by Andreas Fink on 07.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_SMSMI_Correlation_ID.h"
#import "UMDiameterAvp3GPP_HSS_ID.h"
#import "UMDiameterAvp3GPP_Originating_SIP_URI.h"
#import "UMDiameterAvp3GPP_Destination_SIP_URI.h"

@implementation UMDiameterAvp3GPP_SMSMI_Correlation_ID


- (NSString *)avpType
{
    return @"SMSMI-Correlation-ID";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_SMSMI_Correlation_ID;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

- (void)beforeEncode
{
    [super beforeEncode];


    NSString *_hss_id;
    NSString *_originating_sip_uri;
    NSString *_destination_sip_uri;
    NSArray *_custom_avps;

    if(_hss_id.length > 0)
    {
        UMDiameterAvp3GPP_HSS_ID *avp = [[UMDiameterAvp3GPP_HSS_ID alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _hss_id;
        [self appendAvp:avp];
    }
    if(_originating_sip_uri.length > 0)
    {

        /* The Originating-SIP-URI AVP is of type UTF8String. It shall contain the
            Public identity of the IMS UE without MSISDN which is the sender of
            a short message, in the context of MSISDN-less SMS delivery in IMS
           (see 3GPP TS 23.204 [17]).
         */

        // { Origin-Host }
        UMDiameterAvp3GPP_Originating_SIP_URI *avp = [[UMDiameterAvp3GPP_Originating_SIP_URI alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _originating_sip_uri;
        [self appendAvp:avp];
    }
    if(_destination_sip_uri.length > 0)
    {
        UMDiameterAvp3GPP_Destination_SIP_URI *avp = [[UMDiameterAvp3GPP_Destination_SIP_URI alloc]init];
        [avp setFlagMandatory:YES];
        avp.value = _destination_sip_uri;
        [self appendAvp:avp];
    }

    if(_custom_avps.count > 0)
    {
        [self appendAvps:_custom_avps];
    }
}
@end
