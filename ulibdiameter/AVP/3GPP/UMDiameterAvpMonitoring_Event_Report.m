//
//  UMDiameterAvpMonitoring_Event_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

