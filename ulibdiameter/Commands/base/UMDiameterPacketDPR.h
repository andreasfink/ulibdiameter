//
//  UMDiameterPacketDPR.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:40.724000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDisconnect_Cause;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketDPR : UMDiameterPacket
{
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	UMDiameterAvpDisconnect_Cause	*_var_disconnect_cause;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDisconnect_Cause	*disconnect_cause;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)s
;@end

