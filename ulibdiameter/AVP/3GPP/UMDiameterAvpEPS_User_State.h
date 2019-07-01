//
//  UMDiameterAvpEPS_User_State.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMME_User_State;
@class UMDiameterAvpSGSN_User_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_User_State : UMDiameterAvpGrouped
{
	UMDiameterAvpMME_User_State	*_mme_user_state;
	UMDiameterAvpSGSN_User_State	*_sgsn_user_state;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMME_User_State	*mme_user_state;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_User_State	*sgsn_user_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

