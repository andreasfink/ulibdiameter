//
//  UMDiameterAvp3GPP_SMSMI_Correlation_ID.h
//  ulibdiameter
//
//  Created by Andreas Fink on 07.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

/*
3GPP TS 29.328 v15.01 page 47 section 6.3.3.13
 
 SMS-MI-Correlation-ID ::= <AVP header: 3308 10415>
 [ HSS-ID ]
 [ Originating-SIP-URI ]
 [ Destination-SIP-URI ]
 *[ AVP ]

 */

@interface UMDiameterAvp3GPP_SMSMI_Correlation_ID : UMDiameterAvpGrouped
{
    NSString *_hss_id;
    NSString *_originating_sip_uri;
    NSString *_destination_sip_uri;
    NSArray *_custom_avps;
    
}

@property(readwrite,strong,atomic)  NSString *hss_id;
@property(readwrite,strong,atomic)  NSString *originating_sip_uri;
@property(readwrite,strong,atomic)  NSString *destination_sip_uri;
@property(readwrite,strong,atomic)  NSArray *custom_avps;

@end


