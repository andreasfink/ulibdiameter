//
//  UMDiameterAvpMDT_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMDT_Configuration.h"
#import "UMDiameterAvpJob_Type.h"
#import "UMDiameterAvpArea_Scope.h"
#import "UMDiameterAvpList_Of_Measurements.h"
#import "UMDiameterAvpReporting_Trigger.h"
#import "UMDiameterAvpReport_Interval.h"
#import "UMDiameterAvpReport_Amount.h"
#import "UMDiameterAvpEvent_Threshold_RSRP.h"
#import "UMDiameterAvpEvent_Threshold_RSRQ.h"
#import "UMDiameterAvpLogging_Interval.h"
#import "UMDiameterAvpLogging_Duration.h"
#import "UMDiameterAvpMeasurement_Period_LTE.h"
#import "UMDiameterAvpMeasurement_Period_UMTS.h"
#import "UMDiameterAvpCollection_Period_RRM_LTE.h"
#import "UMDiameterAvpCollection_Period_RRM_UMTS.h"
#import "UMDiameterAvpPositioning_Method.h"
#import "UMDiameterAvpMeasurement_Quantity.h"
#import "UMDiameterAvpEvent_Threshold_Event_1F.h"
#import "UMDiameterAvpEvent_Threshold_Event_1I.h"
#import "UMDiameterAvpMDT_Allowed_PLMN_Id.h"
#import "UMDiameterAvpMBSFN_Area.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMDT_Configuration


- (NSString *)avpType
{
    return @"MDT-Configuration";
}

- (uint32_t)avpCode
{
    return 1622;
}

+ (uint32_t)avpCode
{
    return 1622;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_job_type)
    {
        [_var_job_type beforeEncode];
        [arr addObject:_var_job_type];
    }
    if(_var_area_scope)
    {
        [_var_area_scope beforeEncode];
        [arr addObject:_var_area_scope];
    }
    if(_var_list_of_measurements)
    {
        [_var_list_of_measurements beforeEncode];
        [arr addObject:_var_list_of_measurements];
    }
    if(_var_reporting_trigger)
    {
        [_var_reporting_trigger beforeEncode];
        [arr addObject:_var_reporting_trigger];
    }
    if(_var_report_interval)
    {
        [_var_report_interval beforeEncode];
        [arr addObject:_var_report_interval];
    }
    if(_var_report_amount)
    {
        [_var_report_amount beforeEncode];
        [arr addObject:_var_report_amount];
    }
    if(_var_event_threshold_rsrp)
    {
        [_var_event_threshold_rsrp beforeEncode];
        [arr addObject:_var_event_threshold_rsrp];
    }
    if(_var_event_threshold_rsrq)
    {
        [_var_event_threshold_rsrq beforeEncode];
        [arr addObject:_var_event_threshold_rsrq];
    }
    if(_var_logging_interval)
    {
        [_var_logging_interval beforeEncode];
        [arr addObject:_var_logging_interval];
    }
    if(_var_logging_duration)
    {
        [_var_logging_duration beforeEncode];
        [arr addObject:_var_logging_duration];
    }
    if(_var_measurement_period_lte)
    {
        [_var_measurement_period_lte beforeEncode];
        [arr addObject:_var_measurement_period_lte];
    }
    if(_var_measurement_period_umts)
    {
        [_var_measurement_period_umts beforeEncode];
        [arr addObject:_var_measurement_period_umts];
    }
    if(_var_collection_period_rrm_lte)
    {
        [_var_collection_period_rrm_lte beforeEncode];
        [arr addObject:_var_collection_period_rrm_lte];
    }
    if(_var_collection_period_rrm_umts)
    {
        [_var_collection_period_rrm_umts beforeEncode];
        [arr addObject:_var_collection_period_rrm_umts];
    }
    if(_var_positioning_method)
    {
        [_var_positioning_method beforeEncode];
        [arr addObject:_var_positioning_method];
    }
    if(_var_measurement_quantity)
    {
        [_var_measurement_quantity beforeEncode];
        [arr addObject:_var_measurement_quantity];
    }
    if(_var_event_threshold_event_1f)
    {
        [_var_event_threshold_event_1f beforeEncode];
        [arr addObject:_var_event_threshold_event_1f];
    }
    if(_var_event_threshold_event_1i)
    {
        [_var_event_threshold_event_1i beforeEncode];
        [arr addObject:_var_event_threshold_event_1i];
    }
    if(_var_mdt_allowed_plmn_id.count > 0)
    {
        for(UMDiameterAvpMDT_Allowed_PLMN_Id *o in _var_mdt_allowed_plmn_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_mbsfn_area.count > 0)
    {
        for(UMDiameterAvpMBSFN_Area *o in _var_mbsfn_area)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[job-type]",webName];
        [UMDiameterAvpJob_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[area-scope]",webName];
        [UMDiameterAvpArea_Scope appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[list-of-measurements]",webName];
        [UMDiameterAvpList_Of_Measurements appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-trigger]",webName];
        [UMDiameterAvpReporting_Trigger appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[report-interval]",webName];
        [UMDiameterAvpReport_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[report-amount]",webName];
        [UMDiameterAvpReport_Amount appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[event-threshold-rsrp]",webName];
        [UMDiameterAvpEvent_Threshold_RSRP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[event-threshold-rsrq]",webName];
        [UMDiameterAvpEvent_Threshold_RSRQ appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[logging-interval]",webName];
        [UMDiameterAvpLogging_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[logging-duration]",webName];
        [UMDiameterAvpLogging_Duration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[measurement-period-lte]",webName];
        [UMDiameterAvpMeasurement_Period_LTE appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[measurement-period-umts]",webName];
        [UMDiameterAvpMeasurement_Period_UMTS appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[collection-period-rrm-lte]",webName];
        [UMDiameterAvpCollection_Period_RRM_LTE appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[collection-period-rrm-umts]",webName];
        [UMDiameterAvpCollection_Period_RRM_UMTS appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[positioning-method]",webName];
        [UMDiameterAvpPositioning_Method appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[measurement-quantity]",webName];
        [UMDiameterAvpMeasurement_Quantity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[event-threshold-event-1f]",webName];
        [UMDiameterAvpEvent_Threshold_Event_1F appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[event-threshold-event-1i]",webName];
        [UMDiameterAvpEvent_Threshold_Event_1I appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mdt-allowed-plmn-id][]",webName];
        [UMDiameterAvpMDT_Allowed_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mbsfn-area][]",webName];
        [UMDiameterAvpMBSFN_Area appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Job-Type"] = [_var_job_type objectValue];
	dict[@"Area-Scope"] = [_var_area_scope objectValue];
	dict[@"List-Of-Measurements"] = [_var_list_of_measurements objectValue];
	dict[@"Reporting-Trigger"] = [_var_reporting_trigger objectValue];
	dict[@"Report-Interval"] = [_var_report_interval objectValue];
	dict[@"Report-Amount"] = [_var_report_amount objectValue];
	dict[@"Event-Threshold-RSRP"] = [_var_event_threshold_rsrp objectValue];
	dict[@"Event-Threshold-RSRQ"] = [_var_event_threshold_rsrq objectValue];
	dict[@"Logging-Interval"] = [_var_logging_interval objectValue];
	dict[@"Logging-Duration"] = [_var_logging_duration objectValue];
	dict[@"Measurement-Period-LTE"] = [_var_measurement_period_lte objectValue];
	dict[@"Measurement-Period-UMTS"] = [_var_measurement_period_umts objectValue];
	dict[@"Collection-Period-RRM-LTE"] = [_var_collection_period_rrm_lte objectValue];
	dict[@"Collection-Period-RRM-UMTS"] = [_var_collection_period_rrm_umts objectValue];
	dict[@"Positioning-Method"] = [_var_positioning_method objectValue];
	dict[@"Measurement-Quantity"] = [_var_measurement_quantity objectValue];
	dict[@"Event-Threshold-Event-1F"] = [_var_event_threshold_event_1f objectValue];
	dict[@"Event-Threshold-Event-1I"] = [_var_event_threshold_event_1i objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_mdt_allowed_plmn_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_mdt_allowed_plmn_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"MDT-Allowed-PLMN-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_mbsfn_area.count>0)
		{
			for(UMDiameterAvp *avp in _var_mbsfn_area)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"MBSFN-Area"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mdt-configuration";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpJob_Type definition]];
    [entries addObject:[UMDiameterAvpArea_Scope definition]];
    [entries addObject:[UMDiameterAvpList_Of_Measurements definition]];
    [entries addObject:[UMDiameterAvpReporting_Trigger definition]];
    [entries addObject:[UMDiameterAvpReport_Interval definition]];
    [entries addObject:[UMDiameterAvpReport_Amount definition]];
    [entries addObject:[UMDiameterAvpEvent_Threshold_RSRP definition]];
    [entries addObject:[UMDiameterAvpEvent_Threshold_RSRQ definition]];
    [entries addObject:[UMDiameterAvpLogging_Interval definition]];
    [entries addObject:[UMDiameterAvpLogging_Duration definition]];
    [entries addObject:[UMDiameterAvpMeasurement_Period_LTE definition]];
    [entries addObject:[UMDiameterAvpMeasurement_Period_UMTS definition]];
    [entries addObject:[UMDiameterAvpCollection_Period_RRM_LTE definition]];
    [entries addObject:[UMDiameterAvpCollection_Period_RRM_UMTS definition]];
    [entries addObject:[UMDiameterAvpPositioning_Method definition]];
    [entries addObject:[UMDiameterAvpMeasurement_Quantity definition]];
    [entries addObject:[UMDiameterAvpEvent_Threshold_Event_1F definition]];
    [entries addObject:[UMDiameterAvpEvent_Threshold_Event_1I definition]];
    [entries addObject:[UMDiameterAvpMDT_Allowed_PLMN_Id definition]];
    [entries addObject:[UMDiameterAvpMBSFN_Area definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

