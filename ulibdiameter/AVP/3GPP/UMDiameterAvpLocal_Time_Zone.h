//
//  UMDiameterAvpLocal_Time_Zone.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTime_Zone;
@class UMDiameterAvpDaylight_Saving_Time;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLocal_Time_Zone : UMDiameterAvpGrouped
{
	UMDiameterAvpTime_Zone	*_var_time_zone;
	UMDiameterAvpDaylight_Saving_Time	*_var_daylight_saving_time;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpTime_Zone	*var_time_zone;
@property(readwrite,strong,atomic)	UMDiameterAvpDaylight_Saving_Time	*var_daylight_saving_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

