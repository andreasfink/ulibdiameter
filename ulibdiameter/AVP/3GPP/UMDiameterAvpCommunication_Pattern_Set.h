//
//  UMDiameterAvpCommunication_Pattern_Set.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPeriodic_Communication_Indicator;
@class UMDiameterAvpCommunication_Duration_Time;
@class UMDiameterAvpPeriodic_Time;
@class UMDiameterAvpScheduled_Communication_Time;
@class UMDiameterAvpStationary_Indication;
@class UMDiameterAvpReference_ID_Validity_Time;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCommunication_Pattern_Set : UMDiameterAvpGrouped
{
	UMDiameterAvpPeriodic_Communication_Indicator	*_var_periodic_communication_indicator;
	UMDiameterAvpCommunication_Duration_Time	*_var_communication_duration_time;
	UMDiameterAvpPeriodic_Time	*_var_periodic_time;
	NSArray<UMDiameterAvpScheduled_Communication_Time *>	*_var_scheduled_communication_time;
	UMDiameterAvpStationary_Indication	*_var_stationary_indication;
	UMDiameterAvpReference_ID_Validity_Time	*_var_reference_id_validity_time;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPeriodic_Communication_Indicator	*var_periodic_communication_indicator;
@property(readwrite,strong,atomic)	UMDiameterAvpCommunication_Duration_Time	*var_communication_duration_time;
@property(readwrite,strong,atomic)	UMDiameterAvpPeriodic_Time	*var_periodic_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpScheduled_Communication_Time *>	*var_scheduled_communication_time;
@property(readwrite,strong,atomic)	UMDiameterAvpStationary_Indication	*var_stationary_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpReference_ID_Validity_Time	*var_reference_id_validity_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

