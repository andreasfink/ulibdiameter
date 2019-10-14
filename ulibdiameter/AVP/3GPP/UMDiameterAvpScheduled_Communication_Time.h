//
//  UMDiameterAvpScheduled_Communication_Time.h
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpDay_Of_Week_Mask;
@class UMDiameterAvpTime_Of_Day_Start;
@class UMDiameterAvpTime_Of_Day_End;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpScheduled_Communication_Time : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpDay_Of_Week_Mask *>	*_var_day_of_week_mask;
	UMDiameterAvpTime_Of_Day_Start	*_var_time_of_day_start;
	UMDiameterAvpTime_Of_Day_End	*_var_time_of_day_end;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpDay_Of_Week_Mask *>	*var_day_of_week_mask;
@property(readwrite,strong,atomic)	UMDiameterAvpTime_Of_Day_Start	*var_time_of_day_start;
@property(readwrite,strong,atomic)	UMDiameterAvpTime_Of_Day_End	*var_time_of_day_end;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

