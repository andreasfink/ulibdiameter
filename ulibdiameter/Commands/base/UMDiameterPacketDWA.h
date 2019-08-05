//
//  UMDiameterPacketDWA.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:40.589000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpResult_Code;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpError_Message;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketDWA : UMDiameterPacket
{
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpError_Message	*_var_error_message;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

