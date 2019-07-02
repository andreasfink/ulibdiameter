//
//  UMDiameterAvpGERAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_Vector.h"
#import "UMDiameterAvpItem_Number.h";
#import "UMDiameterAvpRAND.h";
#import "UMDiameterAvpSRES.h";
#import "UMDiameterAvpKc.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpGERAN_Vector


- (NSString *)avpType
{
    return @"GERAN-Vector";
}

- (uint32_t)avpCode
{
    return 1416;
}

+ (uint32_t)avpCode
{
    return 1416;
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
    if(_var_item_number)
    {
        [arr addObject:_var_item_number];
    }
    if(_var_rand)
    {
        [arr addObject:_var_rand];
    }
    if(_var_sres)
    {
        [arr addObject:_var_sres];
    }
    if(_var_kc)
    {
        [arr addObject:_var_kc];
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
        if(avp.avpCode == [UMDiameterAvpItem_Number  avpCode])
        {
            avp = [[UMDiameterAvpItem_Number alloc]initWithAvp:avp];
            _var_item_number = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRAND avpCode])
        {
            avp = [[UMDiameterAvpRAND alloc]initWithAvp:avp];
            _var_rand = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSRES avpCode])
        {
            avp = [[UMDiameterAvpSRES alloc]initWithAvp:avp];
            _var_sres = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpKc avpCode])
        {
            avp = [[UMDiameterAvpKc alloc]initWithAvp:avp];
            _var_kc = avp;
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

