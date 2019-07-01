//
//  UMDiameterAvpEPS_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_Location_Information : UMDiameterAvpGrouped
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

