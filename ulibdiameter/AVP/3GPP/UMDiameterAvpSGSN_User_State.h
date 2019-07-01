//
//  UMDiameterAvpSGSN_User_State.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSGSN_User_State : UMDiameterAvpGrouped
{
	UMDiameterAvpUser_State	*_user_state;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpUser_State	*user_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

