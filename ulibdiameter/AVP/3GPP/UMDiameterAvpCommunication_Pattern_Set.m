//
//  UMDiameterAvpCommunication_Pattern_Set.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCommunication_Pattern_Set.h"
#import "UMDiameterAvpPeriodic_Communication_Indicator.h"
#import "UMDiameterAvpCommunication_Duration_Time.h"
#import "UMDiameterAvpPeriodic_Time.h"
#import "UMDiameterAvpScheduled_Communication_Time.h"
#import "UMDiameterAvpStationary_Indication.h"
#import "UMDiameterAvpReference_ID_Validity_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCommunication_Pattern_Set


- (NSString *)avpType
{
    return @"Communication-Pattern-Set";
}

- (uint32_t)avpCode
{
    return 3114;
}

+ (uint32_t)avpCode
{
    return 3114;
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
    if(_var_periodic_communication_indicator)
    {
        [arr addObject:_var_periodic_communication_indicator];
    }
    if(_var_communication_duration_time)
    {
        [arr addObject:_var_communication_duration_time];
    }
    if(_var_periodic_time)
    {
        [arr addObject:_var_periodic_time];
    }
    if(_var_scheduled_communication_time.count > 0)
    {
        for(UMDiameterAvpScheduled_Communication_Time *o in _var_scheduled_communication_time)
        {
            [arr addObject:o];
        }
    }
    if(_var_stationary_indication)
    {
        [arr addObject:_var_stationary_indication];
    }
    if(_var_reference_id_validity_time)
    {
        [arr addObject:_var_reference_id_validity_time];
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

