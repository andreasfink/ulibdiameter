//
//  UMDiameterAvpLoad.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:09.678000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad.h"
#import "UMDiameterAvpLoad_Type.h"
#import "UMDiameterAvpLoad_Value.h"
#import "UMDiameterAvpSourceID.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLoad


- (NSString *)avpType
{
    return @"Load";
}

- (uint32_t)avpCode
{
    return 650;
}

+ (uint32_t)avpCode
{
    return 650;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_load_type)
    {
        [arr addObject:_var_load_type];
    }
    if(_var_load_value)
    {
        [arr addObject:_var_load_value];
    }
    if(_var_sourceid)
    {
        [arr addObject:_var_sourceid];
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
        if(avp.avpCode == [UMDiameterAvpLoad_Type  avpCode])
        {
            avp = [[UMDiameterAvpLoad_Type alloc]initWithAvp:avp];
            _var_load_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLoad_Value avpCode])
        {
            avp = [[UMDiameterAvpLoad_Value alloc]initWithAvp:avp];
            _var_load_value = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSourceID avpCode])
        {
            avp = [[UMDiameterAvpSourceID alloc]initWithAvp:avp];
            _var_sourceid = avp;
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

