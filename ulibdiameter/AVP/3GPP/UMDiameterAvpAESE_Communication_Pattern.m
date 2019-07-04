//
//  UMDiameterAvpAESE_Communication_Pattern.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAESE_Communication_Pattern.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"
#import "UMDiameterAvpCommunication_Pattern_Set.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAESE_Communication_Pattern


- (NSString *)avpType
{
    return @"AESE-Communication-Pattern";
}

- (uint32_t)avpCode
{
    return 3113;
}

+ (uint32_t)avpCode
{
    return 3113;
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
    if(_var_scef_reference_id_for_deletion.count > 0)
    {
        for(UMDiameterAvpSCEF_Reference_ID_for_Deletion *o in _var_scef_reference_id_for_deletion)
        {
            [arr addObject:o];
        }
    }
    if(_var_communication_pattern_set.count > 0)
    {
        for(UMDiameterAvpCommunication_Pattern_Set *o in _var_communication_pattern_set)
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
        else if(avp.avpCode == [UMDiameterAvpCommunication_Pattern_Set avpCode])
        {
            UMDiameterAvpCommunication_Pattern_Set *avp2 = [[UMDiameterAvpCommunication_Pattern_Set alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_communication_pattern_set == NULL)
            {
                _var_communication_pattern_set = @[avp2];
            }
            else
            {
                _var_communication_pattern_set = [_var_communication_pattern_set arrayByAddingObject:avp2];
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

