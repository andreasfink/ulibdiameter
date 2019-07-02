//
//  UMDiameterAvpExternal_Client.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpClient_Identity;
@class UMDiameterAvpGMLC_Restriction;
@class UMDiameterAvpNotification_To_UE_User;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpExternal_Client : UMDiameterAvpGrouped
{
	UMDiameterAvpClient_Identity	*_var_client_identity;
	UMDiameterAvpGMLC_Restriction	*_var_gmlc_restriction;
	UMDiameterAvpNotification_To_UE_User	*_var_notification_to_ue_user;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpClient_Identity	*var_client_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Restriction	*var_gmlc_restriction;
@property(readwrite,strong,atomic)	UMDiameterAvpNotification_To_UE_User	*var_notification_to_ue_user;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

