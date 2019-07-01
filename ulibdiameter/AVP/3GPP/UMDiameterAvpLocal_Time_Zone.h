//
//  UMDiameterAvpLocal_Time_Zone.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTime_Zone;
@class UMDiameterAvpDaylight_Saving_Time;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLocal_Time_Zone : UMDiameterAvpGrouped
{
	UMDiameterAvpTime_Zone	*_time_zone;
	UMDiameterAvpDaylight_Saving_Time	*_daylight_saving_time;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpTime_Zone	*time_zone;
@property(readwrite,strong,atomic)	UMDiameterAvpDaylight_Saving_Time	*daylight_saving_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

