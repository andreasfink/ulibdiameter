//
//  UMDiameterPacket3GPP_UDR.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"

/* USER DATA REQUEST */
@interface UMDiameterPacket3GPP_UDR : UMDiameterPacket
{
    NSString *_session_id;
    NSString *_auth_session_state;
    NSString *_venodr_specific_application_id;
    NSString *_origin_host;
    NSString *_origin_realm;
    NSString *_destination_realm;
    NSString *_supported_features;
    NSString *_user_identity;
    NSString *_user_name;
    NSArray  *_dataReference;
}

@property(readwrite,strong,atomic)  NSString *session_id;
@property(readwrite,strong,atomic)  NSString *auth_session_state;
@property(readwrite,strong,atomic)  NSString *venodr_specific_application_id;
@property(readwrite,strong,atomic)  NSString *origin_host;
@property(readwrite,strong,atomic)  NSString *origin_realm;
@property(readwrite,strong,atomic)  NSString *destination_realm;
@property(readwrite,strong,atomic)  NSString *supported_features;
@property(readwrite,strong,atomic)  NSString *user_identity;
@property(readwrite,strong,atomic)  NSString *user_name;
@property(readwrite,strong,atomic)  NSArray  *dataReference;

@end

