//
//  UMDiameterAvpMonitoring_Event_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Event_Report.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpReachability_Information.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpMonitoring_Type.h"
#import "UMDiameterAvpLoss_Of_Connectivity_Reason.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMonitoring_Event_Report


- (NSString *)avpType
{
    return @"Monitoring-Event-Report";
}

- (uint32_t)avpCode
{
    return 3123;
}

+ (uint32_t)avpCode
{
    return 3123;
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
    if(_var_reachability_information)
    {
        [arr addObject:_var_reachability_information];
    }
    if(_var_eps_location_information)
    {
        [arr addObject:_var_eps_location_information];
    }
    if(_var_monitoring_type)
    {
        [arr addObject:_var_monitoring_type];
    }
    if(_var_loss_of_connectivity_reason)
    {
        [arr addObject:_var_loss_of_connectivity_reason];
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
        else if(avp.avpCode == [UMDiameterAvpReachability_Information avpCode])
        {
            _var_reachability_information = [[UMDiameterAvpReachability_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reachability_information];
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Location_Information avpCode])
        {
            _var_eps_location_information = [[UMDiameterAvpEPS_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_eps_location_information];
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Type avpCode])
        {
            _var_monitoring_type = [[UMDiameterAvpMonitoring_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_type];
        }
        else if(avp.avpCode == [UMDiameterAvpLoss_Of_Connectivity_Reason avpCode])
        {
            _var_loss_of_connectivity_reason = [[UMDiameterAvpLoss_Of_Connectivity_Reason alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_loss_of_connectivity_reason];
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

