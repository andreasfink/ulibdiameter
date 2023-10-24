//
//  UMDiameterAvpEPS_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2021-03-24 11:49:54.159080
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMME_Location_Information;
@class UMDiameterAvpSGSN_Location_Information;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_Location_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpMME_Location_Information	*_var_mme_location_information;
	UMDiameterAvpSGSN_Location_Information	*_var_sgsn_location_information;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMME_Location_Information	*var_mme_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Location_Information	*var_sgsn_location_information;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

