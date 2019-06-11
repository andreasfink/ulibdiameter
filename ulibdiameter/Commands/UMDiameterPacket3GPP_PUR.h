//
//  UMDiameterPacket3GPP_PUR.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

/* PROFILE UPDATE REQUEST */
#import "UMDiameterPacket.h"


@interface UMDiameterPacket3GPP_PUR : UMDiameterPacket
{
    NSString *_sessionId;
    NSString *_vendor_specific_application_id;
    NSString *_auth_session_state;
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_destination_realm;
    NSString *_user_identity;
    NSString *_data_reference;
    NSString *_sh_user_data;
}

@end

