//
//  UMDiameterPacket3GPP_UDA.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"


/* USER DATA ANSWER */

@interface UMDiameterPacket3GPP_UDA : UMDiameterPacket
{
    NSString *_session_id;
    NSString *_auth_session_state;
    NSString *_venodr_specific_application_id;
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_sh_user_data;
    NSString *_supported_features;
    NSString *_result_code;
}

@property(readwrite,strong,atomic)  NSString *session_id;
@property(readwrite,strong,atomic)  NSString *auth_session_state;
@property(readwrite,strong,atomic)  NSString *venodr_specific_application_id;
@property(readwrite,strong,atomic)  NSString *origin_host;
@property(readwrite,strong,atomic)  NSString *origin_realm;
@property(readwrite,strong,atomic)  NSString *sh_user_data;
@property(readwrite,strong,atomic)  NSString *supported_features;
@property(readwrite,strong,atomic)  NSString *result_code;

@end

