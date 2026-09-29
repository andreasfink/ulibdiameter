//
//  UMDiameterAvpEPS_User_State.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpMME_User_State;
@class UMDiameterAvpSGSN_User_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_User_State : UMDiameterAvpGrouped
{
	UMDiameterAvpMME_User_State	*_var_mme_user_state;
	UMDiameterAvpSGSN_User_State	*_var_sgsn_user_state;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMME_User_State	*var_mme_user_state;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_User_State	*var_sgsn_user_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

