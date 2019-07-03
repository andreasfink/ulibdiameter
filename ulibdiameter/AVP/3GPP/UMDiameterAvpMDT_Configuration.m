//
//  UMDiameterAvpMDT_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
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
        [arr addObject:_var_job_type];
    }
    if(_var_area_scope)
    {
        [arr addObject:_var_area_scope];
    }
    if(_var_list_of_measurements)
    {
        [arr addObject:_var_list_of_measurements];
    }
    if(_var_reporting_trigger)
    {
        [arr addObject:_var_reporting_trigger];
    }
    if(_var_report_interval)
    {
        [arr addObject:_var_report_interval];
    }
    if(_var_report_amount)
    {
        [arr addObject:_var_report_amount];
    }
    if(_var_event_threshold_rsrp)
    {
        [arr addObject:_var_event_threshold_rsrp];
    }
    if(_var_event_threshold_rsrq)
    {
        [arr addObject:_var_event_threshold_rsrq];
    }
    if(_var_logging_interval)
    {
        [arr addObject:_var_logging_interval];
    }
    if(_var_logging_duration)
    {
        [arr addObject:_var_logging_duration];
    }
    if(_var_measurement_period_lte)
    {
        [arr addObject:_var_measurement_period_lte];
    }
    if(_var_measurement_period_umts)
    {
        [arr addObject:_var_measurement_period_umts];
    }
    if(_var_collection_period_rrm_lte)
    {
        [arr addObject:_var_collection_period_rrm_lte];
    }
    if(_var_collection_period_rrm_umts)
    {
        [arr addObject:_var_collection_period_rrm_umts];
    }
    if(_var_positioning_method)
    {
        [arr addObject:_var_positioning_method];
    }
    if(_var_measurement_quantity)
    {
        [arr addObject:_var_measurement_quantity];
    }
    if(_var_event_threshold_event_1f)
    {
        [arr addObject:_var_event_threshold_event_1f];
    }
    if(_var_event_threshold_event_1i)
    {
        [arr addObject:_var_event_threshold_event_1i];
    }
    if(_var_mdt_allowed_plmn_id.count > 0)
    {
        for(UMDiameterAvpMDT_Allowed_PLMN_Id *o in _var_mdt_allowed_plmn_id)
        {
            [arr addObject:o];
        }
    }
    if(_var_mbsfn_area.count > 0)
    {
        for(UMDiameterAvpMBSFN_Area *o in _var_mbsfn_area)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


- (void)afterDecode
{
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

