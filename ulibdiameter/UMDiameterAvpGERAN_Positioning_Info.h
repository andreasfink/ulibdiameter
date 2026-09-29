//
//  UMDiameterAvpGERAN_Positioning_Info.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpGERAN_Positioning_Data;
@class UMDiameterAvpGERAN_GANSS_Positioning_Data;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpGERAN_Positioning_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpGERAN_Positioning_Data	*_var_geran_positioning_data;
	UMDiameterAvpGERAN_GANSS_Positioning_Data	*_var_geran_ganss_positioning_data;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpGERAN_Positioning_Data	*var_geran_positioning_data;
@property(readwrite,strong,atomic)	UMDiameterAvpGERAN_GANSS_Positioning_Data	*var_geran_ganss_positioning_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

