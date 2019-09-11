//
//  UMDiameterAvpMonitoring_Event_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

