//
//  UMDiameterAvpLoad.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:50:53.129000
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

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpLoad_Type  avpCode])
        {
            _var_load_type = [[UMDiameterAvpLoad_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_load_type];
        }
        else if(avp.avpCode == [UMDiameterAvpLoad_Value avpCode])
        {
            _var_load_value = [[UMDiameterAvpLoad_Value alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_load_value];
        }
        else if(avp.avpCode == [UMDiameterAvpSourceID avpCode])
        {
            _var_sourceid = [[UMDiameterAvpSourceID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sourceid];
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

