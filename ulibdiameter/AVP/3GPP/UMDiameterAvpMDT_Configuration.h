//
//  UMDiameterAvpMDT_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
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
@class UMDiameterAvpCollection_Period_RMM_LTE;
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
	UMDiameterAvpJob_Type	*_job_type;
	UMDiameterAvpArea_Scope	*_area_scope;
	UMDiameterAvpList_Of_Measurements	*_list_of_measurements;
	UMDiameterAvpReporting_Trigger	*_reporting_trigger;
	UMDiameterAvpReport_Interval	*_report_interval;
	UMDiameterAvpReport_Amount	*_report_amount;
	UMDiameterAvpEvent_Threshold_RSRP	*_event_threshold_rsrp;
	UMDiameterAvpEvent_Threshold_RSRQ	*_event_threshold_rsrq;
	UMDiameterAvpLogging_Interval	*_logging_interval;
	UMDiameterAvpLogging_Duration	*_logging_duration;
	UMDiameterAvpMeasurement_Period_LTE	*_measurement_period_lte;
	UMDiameterAvpMeasurement_Period_UMTS	*_measurement_period_umts;
	UMDiameterAvpCollection_Period_RMM_LTE	*_collection_period_rmm_lte;
	UMDiameterAvpCollection_Period_RRM_UMTS	*_collection_period_rrm_umts;
	UMDiameterAvpPositioning_Method	*_positioning_method;
	UMDiameterAvpMeasurement_Quantity	*_measurement_quantity;
	UMDiameterAvpEvent_Threshold_Event_1F	*_event_threshold_event_1f;
	UMDiameterAvpEvent_Threshold_Event_1I	*_event_threshold_event_1i;
	NSArray<UMDiameterAvpMDT_Allowed_PLMN_Id *>	*_mdt_allowed_plmn_id;
	NSArray<UMDiameterAvpMBSFN_Area *>	*_mbsfn_area;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpJob_Type	*job_type;
@property(readwrite,strong,atomic)	UMDiameterAvpArea_Scope	*area_scope;
@property(readwrite,strong,atomic)	UMDiameterAvpList_Of_Measurements	*list_of_measurements;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Trigger	*reporting_trigger;
@property(readwrite,strong,atomic)	UMDiameterAvpReport_Interval	*report_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpReport_Amount	*report_amount;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_RSRP	*event_threshold_rsrp;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_RSRQ	*event_threshold_rsrq;
@property(readwrite,strong,atomic)	UMDiameterAvpLogging_Interval	*logging_interval;
@property(readwrite,strong,atomic)	UMDiameterAvpLogging_Duration	*logging_duration;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Period_LTE	*measurement_period_lte;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Period_UMTS	*measurement_period_umts;
@property(readwrite,strong,atomic)	UMDiameterAvpCollection_Period_RMM_LTE	*collection_period_rmm_lte;
@property(readwrite,strong,atomic)	UMDiameterAvpCollection_Period_RRM_UMTS	*collection_period_rrm_umts;
@property(readwrite,strong,atomic)	UMDiameterAvpPositioning_Method	*positioning_method;
@property(readwrite,strong,atomic)	UMDiameterAvpMeasurement_Quantity	*measurement_quantity;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_Event_1F	*event_threshold_event_1f;
@property(readwrite,strong,atomic)	UMDiameterAvpEvent_Threshold_Event_1I	*event_threshold_event_1i;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMDT_Allowed_PLMN_Id *>	*mdt_allowed_plmn_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMBSFN_Area *>	*mbsfn_area;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

