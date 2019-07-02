//
//  UMDiameterAvpOC_Supported_Features.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:16.191000
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpOC_Feature_Vector  avpCode])
        {
            avp = [[UMDiameterAvpOC_Feature_Vector alloc]initWithAvp:avp];
            _var_oc_feature_vector = avp;
            [knownAVPs addObject:avp];
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

