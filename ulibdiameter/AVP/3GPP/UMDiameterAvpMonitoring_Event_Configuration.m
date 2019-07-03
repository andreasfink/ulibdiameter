//
//  UMDiameterAvpMonitoring_Event_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Event_Configuration.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpMonitoring_Type.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"
#import "UMDiameterAvpMaximum_Number_of_Reports.h"
#import "UMDiameterAvpMonitoring_Duration.h"
#import "UMDiameterAvpCharged_Party.h"
#import "UMDiameterAvpUE_Reachability_Configuration.h"
#import "UMDiameterAvpLocation_Information_Configuration.h"
#import "UMDiameterAvpSCEF_Realm.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMonitoring_Event_Configuration


- (NSString *)avpType
{
    return @"Monitoring-Event-Configuration";
}

- (uint32_t)avpCode
{
    return 3122;
}

+ (uint32_t)avpCode
{
    return 3122;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_scef_reference_id)
    {
        [arr addObject:_var_scef_reference_id];
    }
    if(_var_scef_id)
    {
        [arr addObject:_var_scef_id];
    }
    if(_var_monitoring_type)
    {
        [arr addObject:_var_monitoring_type];
    }
    if(_var_scef_reference_id_for_deletion.count > 0)
    {
        for(UMDiameterAvpSCEF_Reference_ID_for_Deletion *o in _var_scef_reference_id_for_deletion)
        {
            [arr addObject:o];
        }
    }
    if(_var_maximum_number_of_reports)
    {
        [arr addObject:_var_maximum_number_of_reports];
    }
    if(_var_monitoring_duration)
    {
        [arr addObject:_var_monitoring_duration];
    }
    if(_var_charged_party)
    {
        [arr addObject:_var_charged_party];
    }
    if(_var_ue_reachability_configuration)
    {
        [arr addObject:_var_ue_reachability_configuration];
    }
    if(_var_location_information_configuration)
    {
        [arr addObject:_var_location_information_configuration];
    }
    if(_var_scef_realm)
    {
        [arr addObject:_var_scef_realm];
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
        if(avp.avpCode == [UMDiameterAvpSCEF_Reference_ID  avpCode])
        {
            _var_scef_reference_id = [[UMDiameterAvpSCEF_Reference_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_reference_id];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            _var_scef_id = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_id];
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Type avpCode])
        {
            _var_monitoring_type = [[UMDiameterAvpMonitoring_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_type];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_Reference_ID_for_Deletion avpCode])
        {
            UMDiameterAvpSCEF_Reference_ID_for_Deletion *avp2 = [[UMDiameterAvpSCEF_Reference_ID_for_Deletion alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_scef_reference_id_for_deletion == NULL)
            {
                _var_scef_reference_id_for_deletion = @[avp2];
            }
            else
            {
                _var_scef_reference_id_for_deletion = [_var_scef_reference_id_for_deletion arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMaximum_Number_of_Reports avpCode])
        {
            _var_maximum_number_of_reports = [[UMDiameterAvpMaximum_Number_of_Reports alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_maximum_number_of_reports];
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Duration avpCode])
        {
            _var_monitoring_duration = [[UMDiameterAvpMonitoring_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_duration];
        }
        else if(avp.avpCode == [UMDiameterAvpCharged_Party avpCode])
        {
            _var_charged_party = [[UMDiameterAvpCharged_Party alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_charged_party];
        }
        else if(avp.avpCode == [UMDiameterAvpUE_Reachability_Configuration avpCode])
        {
            _var_ue_reachability_configuration = [[UMDiameterAvpUE_Reachability_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ue_reachability_configuration];
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Information_Configuration avpCode])
        {
            _var_location_information_configuration = [[UMDiameterAvpLocation_Information_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_location_information_configuration];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_Realm avpCode])
        {
            _var_scef_realm = [[UMDiameterAvpSCEF_Realm alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_realm];
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

