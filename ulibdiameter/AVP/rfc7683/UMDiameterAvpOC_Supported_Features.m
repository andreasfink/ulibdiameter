//
//  UMDiameterAvpOC_Supported_Features.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 09:15:57.082000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Supported_Features.h"
#import "UMDiameterAvpOC_Feature_Vector.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpOC_Supported_Features


- (NSString *)avpType
{
    return @"OC-Supported-Features";
}

- (uint32_t)avpCode
{
    return 621;
}

+ (uint32_t)avpCode
{
    return 621;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_oc_feature_vector)
    {
        [arr addObject:_var_oc_feature_vector];
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
        if(avp.avpCode == [UMDiameterAvpOC_Feature_Vector  avpCode])
        {
            _var_oc_feature_vector = [[UMDiameterAvpOC_Feature_Vector alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_feature_vector];
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

