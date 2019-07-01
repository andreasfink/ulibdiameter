//
//  UMDiameterAvpMME_User_State.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMME_Location_Information;
@class UMDiameterAvpSGSN_Location_Information;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMME_User_State : UMDiameterAvpGrouped
{
	UMDiameterAvpMME_Location_Information	*_mme_location_information;
	UMDiameterAvpSGSN_Location_Information	*_sgsn_location_information;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMME_Location_Information	*mme_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Location_Information	*sgsn_location_information;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

