//
//  UMDiameterAvpOC_OLR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:51:06.271000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_OLR.h"
#import "UMDiameterAvpOC_Sequence_Number.h"
#import "UMDiameterAvpOC_Report_Type.h"
#import "UMDiameterAvpOC_Reduction_Percentage.h"
#import "UMDiameterAvpOC_Validity_Duration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpOC_OLR


- (NSString *)avpType
{
    return @"OC-OLR";
}

- (uint32_t)avpCode
{
    return 623;
}

+ (uint32_t)avpCode
{
    return 623;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_oc_sequence_number)
    {
        [arr addObject:_var_oc_sequence_number];
    }
    if(_var_oc_report_type)
    {
        [arr addObject:_var_oc_report_type];
    }
    if(_var_oc_reduction_percentage)
    {
        [arr addObject:_var_oc_reduction_percentage];
    }
    if(_var_oc_validity_duration)
    {
        [arr addObject:_var_oc_validity_duration];
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
        if(avp.avpCode == [UMDiameterAvpOC_Sequence_Number  avpCode])
        {
            _var_oc_sequence_number = [[UMDiameterAvpOC_Sequence_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_sequence_number];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Report_Type avpCode])
        {
            _var_oc_report_type = [[UMDiameterAvpOC_Report_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_report_type];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Reduction_Percentage avpCode])
        {
            _var_oc_reduction_percentage = [[UMDiameterAvpOC_Reduction_Percentage alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_reduction_percentage];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Validity_Duration avpCode])
        {
            _var_oc_validity_duration = [[UMDiameterAvpOC_Validity_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_validity_duration];
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

