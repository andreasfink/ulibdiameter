//
//  UMDiameterPacketDPR.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.386000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpDisconnect_Cause;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketDPR : UMDiameterPacket
{
	UMDiameterAvpOrigin_Host	*_origin_host;
	UMDiameterAvpOrigin_Realm	*_origin_realm;
	UMDiameterAvpDisconnect_Cause	*_disconnect_cause;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDisconnect_Cause	*disconnect_cause;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

@end

