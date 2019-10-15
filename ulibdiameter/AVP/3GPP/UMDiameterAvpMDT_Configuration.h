//
//  UMDiameterAvpMDT_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpJob_Type;
@class UMDiameterAvpArea_Scope;
@class UMDiameterAvpList_Of_Measurements;
@class UMDiameterAvpReporting_Trigger;
@class UMDiameterAvpReport_Interval;
@class UMDiameterAvpReport_Amount;
@class UMDiameterAvpEvent_Threshold_RSRP;
@class UMDiameterAvpEvent_Threshold_RSRQ;
@class UMDiameterAvpLogging_Interval;
@class UMDiameterAvpLogging_Duration;
@class UMDiameterAvpMeasurement_Period_LTE;
@class UMDiameterAvpMeasurement_Period_UMTS;
@class UMDiameterAvpCollection_Period_RRM_LTE;
@class UMDiameterAvpCollection_Period_RRM_UMTS;
@class UMDiameterAvpPositioning_Method;
@class UMDiameterAvpMeasurement_Quantity;
@class UMDiameterAvpEvent_Threshold_Event_1F;
@class UMDiameterAvpEvent_Threshold_Event_1I;
@class UMDiameterAvpMDT_Allowed_PLMN_Id;
@class UMDiameterAvpMBSFN_Area;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMDT_Configuration : UMDiameterAvpGrouped
{
	UMDiameterAvpJob_Type	*_var_job_type;
	UMDiameterAvpArea_Scope	*_var_area_scope;
	UMDiameterAvpList_Of_Measurements	*_var_list_of_measurements;
	UMDiameterAvpReporting_Trigger	*_var_reporting_trigger;
	UMDiameterAvpReport_Interval	*_var_report_interval;
	UMDiameterAvpReport_Amount	*_var_report_amount;
	UMDiameterAvpEvent_Threshold_RSRP	*_var_event_threshold_rsrp;
	UMDiameterAvpEvent_Threshold_RSRQ	*_var_event_threshold_rsrq;
	UMDiameterAvpLogging_Interval	*_var_logging_interval;
	UMDiameterAvpLogging_Duration	*_var_logging_duration;
	UMDiameterAvpMeasurement_Period_LTE	*_var_measurement_period_lte;
	UMDiameterAvpMeasurement_Period_UMTS	*_var_measurement_period_umts;
	UMDiameterAvpCollection_Period_RRM_LTE	*_var_collection_period_rrm_lte;
	UMDiameterAvpCollection_Period_RRM_UMTS	*_var_collection_period_rrm_umts;
	UMDiameterAvpPositioning_Method	*_var_positioning_method;
	UMDiameterAvpMeasurement_Quantity	*_var_measurement_quantity;
	UMDiameterAvpEvent_Threshold_Event_1F	*_var_event_threshold_event_1f;
	UMDiameterAvpEvent_Threshold_Event_1I	*_var_event_threshold_event_1i;
	NSArray<UMDiameterAvpMDT_Allowed_PLMN_Id *>	*_var_mdt_allowed_plmn_id;
	NSArray<UMDiameterAvpMBSFN_Area *>	*_var_mbsfn_area;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpJob_Type	*var_job_type;
@property(readwrite,strong,atomic)	UMDiameterAvpArea_Scope	*var_area_scope;
@property(readwrite,strong,atomic)	UMDiameterAvpList_Of_Measurements	*var_list_of_measurements;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Trigger	*var_reporting_trigger;
@property(readwrite,strong,atomic)	UMDiameterAvpReport_Interval	*var_report_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpReport_Amount	*var_report_amount;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_RSRP	*var_event_threshold_rsrp;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_RSRQ	*var_event_threshold_rsrq;
@property(readwrite,strong,atomic)	UMDiameterAvpLogging_Interval	*var_logging_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpLogging_Duration	*var_logging_duration;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Period_LTE	*var_measurement_period_lte;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Period_UMTS	*var_measurement_period_umts;
@property(readwrite,strong,atomic)	UMDiameterAvpCollection_Period_RRM_LTE	*var_collection_period_rrm_lte;
@property(readwrite,strong,atomic)	UMDiameterAvpCollection_Period_RRM_UMTS	*var_collection_period_rrm_umts;
@property(readwrite,strong,atomic)	UMDiameterAvpPositioning_Method	*var_positioning_method;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Quantity	*var_measurement_quantity;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_Event_1F	*var_event_threshold_event_1f;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_Event_1I	*var_event_threshold_event_1i;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMDT_Allowed_PLMN_Id *>	*var_mdt_allowed_plmn_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMBSFN_Area *>	*var_mbsfn_area;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

