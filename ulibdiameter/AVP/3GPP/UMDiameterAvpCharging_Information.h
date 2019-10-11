//
//  UMDiameterAvpCharging_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPrimary_Event_Charging_Function_Name;
@class UMDiameterAvpSecondary_Event_Charging_Function_Name;
@class UMDiameterAvpPrimary_Charging_Collection_Function_Name;
@class UMDiameterAvpSecondary_Charging_Collection_Function_Name;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCharging_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpPrimary_Event_Charging_Function_Name	*_var_primary_event_charging_function_name;
	UMDiameterAvpSecondary_Event_Charging_Function_Name	*_var_secondary_event_charging_function_name;
	UMDiameterAvpPrimary_Charging_Collection_Function_Name	*_var_primary_charging_collection_function_name;
	UMDiameterAvpSecondary_Charging_Collection_Function_Name	*_var_secondary_charging_collection_function_name;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPrimary_Event_Charging_Function_Name	*var_primary_event_charging_function_name;
@property(readwrite,strong,atomic)	UMDiameterAvpSecondary_Event_Charging_Function_Name	*var_secondary_event_charging_function_name;
@property(readwrite,strong,atomic)	UMDiameterAvpPrimary_Charging_Collection_Function_Name	*var_primary_charging_collection_function_name;
@property(readwrite,strong,atomic)	UMDiameterAvpSecondary_Charging_Collection_Function_Name	*var_secondary_charging_collection_function_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

