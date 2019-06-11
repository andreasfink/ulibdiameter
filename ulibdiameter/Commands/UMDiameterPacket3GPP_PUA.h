//
//  UMDiameterPacket3GPP_PUA.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

/* PROFILE UPDATE ANSWER */

#import "UMDiameterPacket.h"


@interface UMDiameterPacket3GPP_PUA : UMDiameterPacket
{
    NSString *_sessionId;
    NSString *_auth_session_state;
    NSString *_vendor_specific_application_id;
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_result_code;
}
@end

