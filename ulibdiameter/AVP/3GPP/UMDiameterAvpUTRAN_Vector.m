//
//  UMDiameterAvpUTRAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Vector.h"
#import "UMDiameterAvpItem_Number.h"
#import "UMDiameterAvpRAND.h"
#import "UMDiameterAvpXRES.h"
#import "UMDiameterAvpAUTN.h"
#import "UMDiameterAvpConfidentiality_Key.h"
#import "UMDiameterAvpIntegrity_Key.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUTRAN_Vector


- (NSString *)avpType
{
    return @"UTRAN-Vector";
}

- (uint32_t)avpCode
{
    return 1415;
}

+ (uint32_t)avpCode
{
    return 1415;
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
    if(_var_confidentiality_key)
    {
        [arr addObject:_var_confidentiality_key];
    }
    if(_var_integrity_key)
    {
        [arr addObject:_var_integrity_key];
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
        if(avp.avpCode == [UMDiameterAvpItem_Number  avpCode])
        {
            _var_item_number = [[UMDiameterAvpItem_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_item_number];
        }
        else if(avp.avpCode == [UMDiameterAvpRAND avpCode])
        {
            _var_rand = [[UMDiameterAvpRAND alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_rand];
        }
        else if(avp.avpCode == [UMDiameterAvpXRES avpCode])
        {
            _var_xres = [[UMDiameterAvpXRES alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_xres];
        }
        else if(avp.avpCode == [UMDiameterAvpAUTN avpCode])
        {
            _var_autn = [[UMDiameterAvpAUTN alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_autn];
        }
        else if(avp.avpCode == [UMDiameterAvpConfidentiality_Key avpCode])
        {
            _var_confidentiality_key = [[UMDiameterAvpConfidentiality_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_confidentiality_key];
        }
        else if(avp.avpCode == [UMDiameterAvpIntegrity_Key avpCode])
        {
            _var_integrity_key = [[UMDiameterAvpIntegrity_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_integrity_key];
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

