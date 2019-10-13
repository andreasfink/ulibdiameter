//
//  UMDiameterAvpMDT_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
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
        [o beforeEncode];
        [arr addObject:_var_job_type];
    }
    if(_var_area_scope)
    {
        [o beforeEncode];
        [arr addObject:_var_area_scope];
    }
    if(_var_list_of_measurements)
    {
        [o beforeEncode];
        [arr addObject:_var_list_of_measurements];
    }
    if(_var_reporting_trigger)
    {
        [o beforeEncode];
        [arr addObject:_var_reporting_trigger];
    }
    if(_var_report_interval)
    {
        [o beforeEncode];
        [arr addObject:_var_report_interval];
    }
    if(_var_report_amount)
    {
        [o beforeEncode];
        [arr addObject:_var_report_amount];
    }
    if(_var_event_threshold_rsrp)
    {
        [o beforeEncode];
        [arr addObject:_var_event_threshold_rsrp];
    }
    if(_var_event_threshold_rsrq)
    {
        [o beforeEncode];
        [arr addObject:_var_event_threshold_rsrq];
    }
    if(_var_logging_interval)
    {
        [o beforeEncode];
        [arr addObject:_var_logging_interval];
    }
    if(_var_logging_duration)
    {
        [o beforeEncode];
        [arr addObject:_var_logging_duration];
    }
    if(_var_measurement_period_lte)
    {
        [o beforeEncode];
        [arr addObject:_var_measurement_period_lte];
    }
    if(_var_measurement_period_umts)
    {
        [o beforeEncode];
        [arr addObject:_var_measurement_period_umts];
    }
    if(_var_collection_period_rrm_lte)
    {
        [o beforeEncode];
        [arr addObject:_var_collection_period_rrm_lte];
    }
    if(_var_collection_period_rrm_umts)
    {
        [o beforeEncode];
        [arr addObject:_var_collection_period_rrm_umts];
    }
    if(_var_positioning_method)
    {
        [o beforeEncode];
        [arr addObject:_var_positioning_method];
    }
    if(_var_measurement_quantity)
    {
        [o beforeEncode];
        [arr addObject:_var_measurement_quantity];
    }
    if(_var_event_threshold_event_1f)
    {
        [o beforeEncode];
        [arr addObject:_var_event_threshold_event_1f];
    }
    if(_var_event_threshold_event_1i)
    {
        [o beforeEncode];
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

@end

