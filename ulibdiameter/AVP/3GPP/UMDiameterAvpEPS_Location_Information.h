//
//  UMDiameterAvpEPS_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_Location_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpUser_State	*_var_user_state;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpUser_State	*var_user_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

