//
//  UMDiameterPacketCUA.h
//  ulibdiameter
//
//  Created by afink on 2021-03-02 21:30:27.351539
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import <ulibdiameter/UMDiameterPacket.h>

@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpResult_Code;
@class UMDiameterAvpError_Message;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketCUA : UMDiameterPacket
{
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpError_Message	*_var_error_message;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*var_error_message;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

