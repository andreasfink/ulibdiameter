//
//  UMDiameterAvpService_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpServiceTypeIdentity;
@class UMDiameterAvpGMLC_Restriction;
@class UMDiameterAvpNotification_To_UE_User;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpService_Type : UMDiameterAvpGrouped
{
	UMDiameterAvpServiceTypeIdentity	*_servicetypeidentity;
	UMDiameterAvpGMLC_Restriction	*_gmlc_restriction;
	UMDiameterAvpNotification_To_UE_User	*_notification_to_ue_user;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpServiceTypeIdentity	*servicetypeidentity;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Restriction	*gmlc_restriction;
@property(readwrite,strong,atomic)	UMDiameterAvpNotification_To_UE_User	*notification_to_ue_user;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

