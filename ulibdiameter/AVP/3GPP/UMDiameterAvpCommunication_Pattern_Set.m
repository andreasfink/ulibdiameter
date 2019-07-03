//
//  UMDiameterAvpCommunication_Pattern_Set.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpPeriodic_Communication_Indicator  avpCode])
        {
            _var_periodic_communication_indicator = [[UMDiameterAvpPeriodic_Communication_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_periodic_communication_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpCommunication_Duration_Time avpCode])
        {
            _var_communication_duration_time = [[UMDiameterAvpCommunication_Duration_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_communication_duration_time];
        }
        else if(avp.avpCode == [UMDiameterAvpPeriodic_Time avpCode])
        {
            _var_periodic_time = [[UMDiameterAvpPeriodic_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_periodic_time];
        }
        else if(avp.avpCode == [UMDiameterAvpScheduled_Communication_Time avpCode])
        {
            UMDiameterAvpScheduled_Communication_Time *avp2 = [[UMDiameterAvpScheduled_Communication_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_scheduled_communication_time == NULL)
            {
                _var_scheduled_communication_time = @[avp2];
            }
            else
            {
                _var_scheduled_communication_time = [_var_scheduled_communication_time arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpStationary_Indication avpCode])
        {
            _var_stationary_indication = [[UMDiameterAvpStationary_Indication alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_stationary_indication];
        }
        else if(avp.avpCode == [UMDiameterAvpReference_ID_Validity_Time avpCode])
        {
            _var_reference_id_validity_time = [[UMDiameterAvpReference_ID_Validity_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reference_id_validity_time];
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

