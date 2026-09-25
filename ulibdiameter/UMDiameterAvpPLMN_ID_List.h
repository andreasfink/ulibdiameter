//
//  UMDiameterAvpPLMN_ID_List.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpPeriodic_Location_Support_Indicator;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpPLMN_ID_List : UMDiameterAvpGrouped
{
	UMDiameterAvpVisited_PLMN_Id	*_var_visited_plmn_id;
	UMDiameterAvpPeriodic_Location_Support_Indicator	*_var_periodic_location_support_indicator;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*var_visited_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpPeriodic_Location_Support_Indicator	*var_periodic_location_support_indicator;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

