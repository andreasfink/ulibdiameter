//
//  UMDiameterAvpLCS_PrivacyException.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
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
	UMDiameterAvpSS_Code	*_var_ss_code;
	UMDiameterAvpSS_Status	*_var_ss_status;
	UMDiameterAvpNotification_To_UE_User	*_var_notification_to_ue_user;
	NSArray<UMDiameterAvpExternal_Client *>	*_var_external_client;
	NSArray<UMDiameterAvpPLMN_Client *>	*_var_plmn_client;
	NSArray<UMDiameterAvpService_Type *>	*_var_service_type;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSS_Code	*var_ss_code;
@property(readwrite,strong,atomic)	UMDiameterAvpSS_Status	*var_ss_status;
@property(readwrite,strong,atomic)	UMDiameterAvpNotification_To_UE_User	*var_notification_to_ue_user;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpExternal_Client *>	*var_external_client;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpPLMN_Client *>	*var_plmn_client;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Type *>	*var_service_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

