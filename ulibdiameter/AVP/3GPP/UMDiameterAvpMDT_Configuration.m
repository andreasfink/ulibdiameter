//
//  UMDiameterAvpMDT_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpMDT_Configuration.h>
#import <ulibdiameter/UMDiameterAvpJob_Type.h>
#import <ulibdiameter/UMDiameterAvpArea_Scope.h>
#import <ulibdiameter/UMDiameterAvpList_Of_Measurements.h>
#import <ulibdiameter/UMDiameterAvpReporting_Trigger.h>
#import <ulibdiameter/UMDiameterAvpReport_Interval.h>
#import <ulibdiameter/UMDiameterAvpReport_Amount.h>
#import <ulibdiameter/UMDiameterAvpEvent_Threshold_RSRP.h>
#import <ulibdiameter/UMDiameterAvpEvent_Threshold_RSRQ.h>
#import <ulibdiameter/UMDiameterAvpLogging_Interval.h>
#import <ulibdiameter/UMDiameterAvpLogging_Duration.h>
#import <ulibdiameter/UMDiameterAvpMeasurement_Period_LTE.h>
#import <ulibdiameter/UMDiameterAvpMeasurement_Period_UMTS.h>
#import <ulibdiameter/UMDiameterAvpCollection_Period_RRM_LTE.h>
#import <ulibdiameter/UMDiameterAvpCollection_Period_RRM_UMTS.h>
#import <ulibdiameter/UMDiameterAvpPositioning_Method.h>
#import <ulibdiameter/UMDiameterAvpMeasurement_Quantity.h>
#import <ulibdiameter/UMDiameterAvpEvent_Threshold_Event_1F.h>
#import <ulibdiameter/UMDiameterAvpEvent_Threshold_Event_1I.h>
#import <ulibdiameter/UMDiameterAvpMDT_Allowed_PLMN_Id.h>
#import <ulibdiameter/UMDiameterAvpMBSFN_Area.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

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


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpJob_Type  avpCode])
        {
            _var_job_type = [[UMDiameterAvpJob_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_job_type];
        }
        else if(avp.avpCode == [UMDiameterAvpArea_Scope avpCode])
        {
            _var_area_scope = [[UMDiameterAvpArea_Scope alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_area_scope];
        }
        else if(avp.avpCode == [UMDiameterAvpList_Of_Measurements avpCode])
        {
            _var_list_of_measurements = [[UMDiameterAvpList_Of_Measurements alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_list_of_measurements];
        }
        else if(avp.avpCode == [UMDiameterAvpReporting_Trigger avpCode])
        {
            _var_reporting_trigger = [[UMDiameterAvpReporting_Trigger alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reporting_trigger];
        }
        else if(avp.avpCode == [UMDiameterAvpReport_Interval avpCode])
        {
            _var_report_interval = [[UMDiameterAvpReport_Interval alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_report_interval];
        }
        else if(avp.avpCode == [UMDiameterAvpReport_Amount avpCode])
        {
            _var_report_amount = [[UMDiameterAvpReport_Amount alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_report_amount];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_RSRP avpCode])
        {
            _var_event_threshold_rsrp = [[UMDiameterAvpEvent_Threshold_RSRP alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_event_threshold_rsrp];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_RSRQ avpCode])
        {
            _var_event_threshold_rsrq = [[UMDiameterAvpEvent_Threshold_RSRQ alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_event_threshold_rsrq];
        }
        else if(avp.avpCode == [UMDiameterAvpLogging_Interval avpCode])
        {
            _var_logging_interval = [[UMDiameterAvpLogging_Interval alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_logging_interval];
        }
        else if(avp.avpCode == [UMDiameterAvpLogging_Duration avpCode])
        {
            _var_logging_duration = [[UMDiameterAvpLogging_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_logging_duration];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Period_LTE avpCode])
        {
            _var_measurement_period_lte = [[UMDiameterAvpMeasurement_Period_LTE alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_measurement_period_lte];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Period_UMTS avpCode])
        {
            _var_measurement_period_umts = [[UMDiameterAvpMeasurement_Period_UMTS alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_measurement_period_umts];
        }
        else if(avp.avpCode == [UMDiameterAvpCollection_Period_RRM_LTE avpCode])
        {
            _var_collection_period_rrm_lte = [[UMDiameterAvpCollection_Period_RRM_LTE alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_collection_period_rrm_lte];
        }
        else if(avp.avpCode == [UMDiameterAvpCollection_Period_RRM_UMTS avpCode])
        {
            _var_collection_period_rrm_umts = [[UMDiameterAvpCollection_Period_RRM_UMTS alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_collection_period_rrm_umts];
        }
        else if(avp.avpCode == [UMDiameterAvpPositioning_Method avpCode])
        {
            _var_positioning_method = [[UMDiameterAvpPositioning_Method alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_positioning_method];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Quantity avpCode])
        {
            _var_measurement_quantity = [[UMDiameterAvpMeasurement_Quantity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_measurement_quantity];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_Event_1F avpCode])
        {
            _var_event_threshold_event_1f = [[UMDiameterAvpEvent_Threshold_Event_1F alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_event_threshold_event_1f];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_Event_1I avpCode])
        {
            _var_event_threshold_event_1i = [[UMDiameterAvpEvent_Threshold_Event_1I alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_event_threshold_event_1i];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_Allowed_PLMN_Id avpCode])
        {
            UMDiameterAvpMDT_Allowed_PLMN_Id *avp2 = [[UMDiameterAvpMDT_Allowed_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mdt_allowed_plmn_id == NULL)
            {
                _var_mdt_allowed_plmn_id = @[avp2];
            }
            else
            {
                _var_mdt_allowed_plmn_id = [_var_mdt_allowed_plmn_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMBSFN_Area avpCode])
        {
            UMDiameterAvpMBSFN_Area *avp2 = [[UMDiameterAvpMBSFN_Area alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mbsfn_area == NULL)
            {
                _var_mbsfn_area = @[avp2];
            }
            else
            {
                _var_mbsfn_area = [_var_mbsfn_area arrayByAddingObject:avp2];
            }
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    if(unknownAVPs.count>0)
    {
        _var_avp = unknownAVPs;
        [knownAVPs addObject:[_var_avp copy]];
    }
    [self setArray:knownAVPs];
}

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
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpJob_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpArea_Scope definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpList_Of_Measurements definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReporting_Trigger definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReport_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReport_Amount definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEvent_Threshold_RSRP definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEvent_Threshold_RSRQ definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLogging_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLogging_Duration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMeasurement_Period_LTE definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMeasurement_Period_UMTS definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCollection_Period_RRM_LTE definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCollection_Period_RRM_UMTS definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPositioning_Method definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMeasurement_Quantity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEvent_Threshold_Event_1F definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEvent_Threshold_Event_1I definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMDT_Allowed_PLMN_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMBSFN_Area definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

