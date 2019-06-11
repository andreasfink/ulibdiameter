//
//  UMDiameterAvp3GPP_Serving_node.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"


@interface UMDiameterAvp3GPP_Serving_node : UMDiameterAvpGrouped

/*
 Serving-Node ::=<AVP header: 2401 10415>
 [ SGSN-Name ]
 [ SGSN-Realm ]
 [ SGSN-Number ]
 [ MME-Name ]
 [ MME-Realm ]
 [ MME-Number-for-MT-SMS ] [ MSC-Number ]
 [ IP-SM-GW-Number ]
 [ IP-SM-GW-Name ]
 [ IP-SM-GW-Realm ]
 *[AVP]
 */

{
    NSString *_sgsn_name;
    NSString *_sgsn_realm;
    NSString *_sgsn_number;
    NSString *_mme_name;
    NSString *_mme_realm;
    NSString *_mme_number_for_mt_sms;
    NSString *_msc_number;
    NSString *_ip_sm_gw_number;
    NSString *_ip_sm_gw_name;
    NSString *_ip_sm_gw_realm;
    NSArray *_custom_avp;
}


@property(readwrite,strong,atomic)  NSString *sgsn_name;
@property(readwrite,strong,atomic)  NSString *sgsn_realm;
@property(readwrite,strong,atomic)  NSString *sgsn_number;
@property(readwrite,strong,atomic)  NSString *mme_name;
@property(readwrite,strong,atomic)  NSString *mme_realm;
@property(readwrite,strong,atomic)  NSString *mme_number_for_mt_sms;
@property(readwrite,strong,atomic)  NSString *msc_number;
@property(readwrite,strong,atomic)  NSString *ip_sm_gw_number;
@property(readwrite,strong,atomic)  NSString *ip_sm_gw_name;
@property(readwrite,strong,atomic)  NSString *ip_sm_gw_realm;
@property(readwrite,strong,atomic)  NSArray *custom_avp;

@end

