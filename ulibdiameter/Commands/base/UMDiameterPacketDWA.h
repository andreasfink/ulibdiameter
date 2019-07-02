//
//  UMDiameterPacketDWA.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.336000
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
	UMDiameterAvpResult_Code	*_varresult_code;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	UMDiameterAvpError_Message	*_varerror_message;
	UMDiameterAvpFailed_AVP	*_varfailed_avp;
	UMDiameterAvpOrigin_State_Id	*_varorigin_state_id;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

@end

