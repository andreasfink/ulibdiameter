//
//  UMDiameterAvpMDT_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_job_type)
    {
        [arr addObject:_job_type]
    }
    if(_area_scope)
    {
        [arr addObject:_area_scope]
    }
    if(_list_of_measurements)
    {
        [arr addObject:_list_of_measurements]
    }
    if(_reporting_trigger)
    {
        [arr addObject:_reporting_trigger]
    }
    if(_report_interval)
    {
        [arr addObject:_report_interval]
    }
    if(_report_amount)
    {
        [arr addObject:_report_amount]
    }
    if(_event_threshold_rsrp)
    {
        [arr addObject:_event_threshold_rsrp]
    }
    if(_event_threshold_rsrq)
    {
        [arr addObject:_event_threshold_rsrq]
    }
    if(_logging_interval)
    {
        [arr addObject:_logging_interval]
    }
    if(_logging_duration)
    {
        [arr addObject:_logging_duration]
    }
    if(_measurement_period_lte)
    {
        [arr addObject:_measurement_period_lte]
    }
    if(_measurement_period_umts)
    {
        [arr addObject:_measurement_period_umts]
    }
    if(_collection_period_rmm_lte)
    {
        [arr addObject:_collection_period_rmm_lte]
    }
    if(_collection_period_rrm_umts)
    {
        [arr addObject:_collection_period_rrm_umts]
    }
    if(_positioning_method)
    {
        [arr addObject:_positioning_method]
    }
    if(_measurement_quantity)
    {
        [arr addObject:_measurement_quantity]
    }
    if(_event_threshold_event_1f)
    {
        [arr addObject:_event_threshold_event_1f]
    }
    if(_event_threshold_event_1i)
    {
        [arr addObject:_event_threshold_event_1i]
    }
    if(_mdt_allowed_plmn_id.count > 0)
    {
        for(UMDiameterAvpMDT_Allowed_PLMN_Id *o in _mdt_allowed_plmn_id)
        {
            [arr addObject:o]
        }
    }
    if(_mbsfn_area.count > 0)
    {
        for(UMDiameterAvpMBSFN_Area *o in _mbsfn_area)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpJob_Type  avpCode])
        {
            avp = [[UMDiameterAvpJob_Type alloc]initWithAvp:avp];
            _job_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpArea_Scope avpCode])
        {
            avp = [[UMDiameterAvpArea_Scope alloc]initWithAvp:avp];
            _area_scope = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpList_Of_Measurements avpCode])
        {
            avp = [[UMDiameterAvpList_Of_Measurements alloc]initWithAvp:avp];
            _list_of_measurements = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpReporting_Trigger avpCode])
        {
            avp = [[UMDiameterAvpReporting_Trigger alloc]initWithAvp:avp];
            _reporting_trigger = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpReport_Interval avpCode])
        {
            avp = [[UMDiameterAvpReport_Interval alloc]initWithAvp:avp];
            _report_interval = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpReport_Amount avpCode])
        {
            avp = [[UMDiameterAvpReport_Amount alloc]initWithAvp:avp];
            _report_amount = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_RSRP avpCode])
        {
            avp = [[UMDiameterAvpEvent_Threshold_RSRP alloc]initWithAvp:avp];
            _event_threshold_rsrp = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_RSRQ avpCode])
        {
            avp = [[UMDiameterAvpEvent_Threshold_RSRQ alloc]initWithAvp:avp];
            _event_threshold_rsrq = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLogging_Interval avpCode])
        {
            avp = [[UMDiameterAvpLogging_Interval alloc]initWithAvp:avp];
            _logging_interval = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLogging_Duration avpCode])
        {
            avp = [[UMDiameterAvpLogging_Duration alloc]initWithAvp:avp];
            _logging_duration = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Period_LTE avpCode])
        {
            avp = [[UMDiameterAvpMeasurement_Period_LTE alloc]initWithAvp:avp];
            _measurement_period_lte = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Period_UMTS avpCode])
        {
            avp = [[UMDiameterAvpMeasurement_Period_UMTS alloc]initWithAvp:avp];
            _measurement_period_umts = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCollection_Period_RMM_LTE avpCode])
        {
            avp = [[UMDiameterAvpCollection_Period_RMM_LTE alloc]initWithAvp:avp];
            _collection_period_rmm_lte = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCollection_Period_RRM_UMTS avpCode])
        {
            avp = [[UMDiameterAvpCollection_Period_RRM_UMTS alloc]initWithAvp:avp];
            _collection_period_rrm_umts = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpPositioning_Method avpCode])
        {
            avp = [[UMDiameterAvpPositioning_Method alloc]initWithAvp:avp];
            _positioning_method = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMeasurement_Quantity avpCode])
        {
            avp = [[UMDiameterAvpMeasurement_Quantity alloc]initWithAvp:avp];
            _measurement_quantity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_Event_1F avpCode])
        {
            avp = [[UMDiameterAvpEvent_Threshold_Event_1F alloc]initWithAvp:avp];
            _event_threshold_event_1f = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpEvent_Threshold_Event_1I avpCode])
        {
            avp = [[UMDiameterAvpEvent_Threshold_Event_1I alloc]initWithAvp:avp];
            _event_threshold_event_1i = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMDT_Allowed_PLMN_Id avpCode])
        {
            avp = [[UMDiameterAvpMDT_Allowed_PLMN_Id alloc]initWithAvp:avp];
            _mdt_allowed_plmn_id = avp;
            [knownAVPs addObject:avp];
            if(_mdt_allowed_plmn_id == NULL)
            {
                _mdt_allowed_plmn_id = @[avp];
            }
            else
            {
                _mdt_allowed_plmn_id = [_mdt_allowed_plmn_id arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMBSFN_Area avpCode])
        {
            avp = [[UMDiameterAvpMBSFN_Area alloc]initWithAvp:avp];
            _mbsfn_area = avp;
            [knownAVPs addObject:avp];
            if(_mbsfn_area == NULL)
            {
                _mbsfn_area = @[avp];
            }
            else
            {
                _mbsfn_area = [_mbsfn_area arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

