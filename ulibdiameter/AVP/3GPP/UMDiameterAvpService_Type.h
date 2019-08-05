//
//  UMDiameterAvpService_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpServiceTypeIdentity;
@class UMDiameterAvpGMLC_Restriction;
@class UMDiameterAvpNotification_To_UE_User;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpService_Type : UMDiameterAvpGrouped
{
	UMDiameterAvpServiceTypeIdentity	*_var_servicetypeidentity;
	UMDiameterAvpGMLC_Restriction	*_var_gmlc_restriction;
	UMDiameterAvpNotification_To_UE_User	*_var_notification_to_ue_user;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpServiceTypeIdentity	*var_servicetypeidentity;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Restriction	*var_gmlc_restriction;
@property(readwrite,strong,atomic)	UMDiameterAvpNotification_To_UE_User	*var_notification_to_ue_user;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

