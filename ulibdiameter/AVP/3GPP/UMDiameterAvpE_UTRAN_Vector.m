//
//  UMDiameterAvpE_UTRAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpE_UTRAN_Vector.h"
#import "UMDiameterAvpItem_Number.h";
#import "UMDiameterAvpRAND.h";
#import "UMDiameterAvpXRES.h";
#import "UMDiameterAvpAUTN.h";
#import "UMDiameterAvpKASME.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpE_UTRAN_Vector


- (NSString *)avpType
{
    return @"E-UTRAN-Vector";
}

- (uint32_t)avpCode
{
    return 1414;
}

+ (uint32_t)avpCode
{
    return 1414;
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
    if(_var_xres)
    {
        [arr addObject:_var_xres];
    }
    if(_var_autn)
    {
        [arr addObject:_var_autn];
    }
    if(_var_kasme)
    {
        [arr addObject:_var_kasme];
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
        else if(avp.avpCode == [UMDiameterAvpXRES avpCode])
        {
            avp = [[UMDiameterAvpXRES alloc]initWithAvp:avp];
            _var_xres = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAUTN avpCode])
        {
            avp = [[UMDiameterAvpAUTN alloc]initWithAvp:avp];
            _var_autn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpKASME avpCode])
        {
            avp = [[UMDiameterAvpKASME alloc]initWithAvp:avp];
            _var_kasme = avp;
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

