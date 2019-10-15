//
//  UMDiameterAvpArea_Event_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpArea_Definition;
@class UMDiameterAvpOccurrence_Info;
@class UMDiameterAvpInterval_Time;
@class UMDiameterAvpMaximum_Interval;
@class UMDiameterAvpSampling_Interval;
@class UMDiameterAvpReporting_Duration;
@class UMDiameterAvpReporting_Location_Requirements;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpArea_Event_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpArea_Definition	*_var_area_definition;
	UMDiameterAvpOccurrence_Info	*_var_occurrence_info;
	UMDiameterAvpInterval_Time	*_var_interval_time;
	UMDiameterAvpMaximum_Interval	*_var_maximum_interval;
	UMDiameterAvpSampling_Interval	*_var_sampling_interval;
	UMDiameterAvpReporting_Duration	*_var_reporting_duration;
	UMDiameterAvpReporting_Location_Requirements	*_var_reporting_location_requirements;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpArea_Definition	*var_area_definition;
@property(readwrite,strong,atomic)	UMDiameterAvpOccurrence_Info	*var_occurrence_info;
@property(readwrite,strong,atomic)	UMDiameterAvpInterval_Time	*var_interval_time;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_Interval	*var_maximum_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpSampling_Interval	*var_sampling_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Duration	*var_reporting_duration;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Location_Requirements	*var_reporting_location_requirements;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

