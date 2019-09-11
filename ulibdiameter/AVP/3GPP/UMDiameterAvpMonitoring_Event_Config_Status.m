//
//  UMDiameterAvpMonitoring_Event_Config_Status.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Event_Config_Status.h"
#import "UMDiameterAvpService_Report.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMonitoring_Event_Config_Status


- (NSString *)avpType
{
    return @"Monitoring-Event-Config_Status";
}

- (uint32_t)avpCode
{
    return 3142;
}

+ (uint32_t)avpCode
{
    return 3142;
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
    if(_var_service_report)
    {
        [arr addObject:_var_service_report];
    }
    if(_var_scef_reference_id)
    {
        [arr addObject:_var_scef_reference_id];
    }
    if(_var_scef_id)
    {
        [arr addObject:_var_scef_id];
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

