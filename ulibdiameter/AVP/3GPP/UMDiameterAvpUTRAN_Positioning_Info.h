//
//  UMDiameterAvpUTRAN_Positioning_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUTRAN_Positioning_Data;
@class UMDiameterAvpUTRAN_GANSS_Positioning_Data;
@class UMDiameterAvpUTRAN_Additional_Positioning_Data;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpUTRAN_Positioning_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpUTRAN_Positioning_Data	*_var_utran_positioning_data;
	UMDiameterAvpUTRAN_GANSS_Positioning_Data	*_var_utran_ganss_positioning_data;
	UMDiameterAvpUTRAN_Additional_Positioning_Data	*_var_utran_additional_positioning_data;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpUTRAN_Positioning_Data	*var_utran_positioning_data;
@property(readwrite,strong,atomic)	UMDiameterAvpUTRAN_GANSS_Positioning_Data	*var_utran_ganss_positioning_data;
@property(readwrite,strong,atomic)	UMDiameterAvpUTRAN_Additional_Positioning_Data	*var_utran_additional_positioning_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

