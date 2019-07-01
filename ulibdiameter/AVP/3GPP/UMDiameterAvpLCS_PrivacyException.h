//
//  UMDiameterAvpLCS_PrivacyException.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSS_Code;
@class UMDiameterAvpSS_Status;
@class UMDiameterAvpNotification_To_UE_User;
@class UMDiameterAvpExternal_Client;
@class UMDiameterAvpPLMN_Client;
@class UMDiameterAvpService_Type;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLCS_PrivacyException : UMDiameterAvpGrouped
{
	UMDiameterAvpSS_Code	*_ss_code;
	UMDiameterAvpSS_Status	*_ss_status;
	UMDiameterAvpNotification_To_UE_User	*_notification_to_ue_user;
	NSArray<UMDiameterAvpExternal_Client *>	*_external_client;
	NSArray<UMDiameterAvpPLMN_Client *>	*_plmn_client;
	NSArray<UMDiameterAvpService_Type *>	*_service_type;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSS_Code	*ss_code;
@property(readwrite,strong,atomic)	UMDiameterAvpSS_Status	*ss_status;
@property(readwrite,strong,atomic)	UMDiameterAvpNotification_To_UE_User	*notification_to_ue_user;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpExternal_Client *>	*external_client;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpPLMN_Client *>	*plmn_client;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Type *>	*service_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

