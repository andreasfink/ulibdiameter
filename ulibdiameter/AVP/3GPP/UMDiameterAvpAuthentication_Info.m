//
//  UMDiameterAvpAuthentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuthentication_Info.h"

@implementation UMDiameterAvpAuthentication_Info


- (NSString *)avpType
{
    return @"Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1413;
}

+ (uint32_t)avpCode
{
    return 1413;
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
    if(_var_e_utran_vector.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Vector *o in _var_e_utran_vector)
        {
            [arr addObject:o];
        }
    }
    if(_var_utran_vector.count > 0)
    {
        for(UMDiameterAvpUTRAN_Vector *o in _var_utran_vector)
        {
            [arr addObject:o];
        }
    }
    if(_var_geran_vector.count > 0)
    {
        for(UMDiameterAvpGERAN_Vector *o in _var_geran_vector)
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpE_UTRAN_Vector  avpCode])
        {
            avp = [[UMDiameterAvpE_UTRAN_Vector alloc]initWithAvp:avp];
            _var_e_utran_vector = avp;
            [knownAVPs addObject:avp];
            if(_var_e_utran_vector == NULL)
            {
                _var_e_utran_vector = @[avp];
            }
            else
            {
                _var_e_utran_vector = [_var_e_utran_vector arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUTRAN_Vector avpCode])
        {
            avp = [[UMDiameterAvpUTRAN_Vector alloc]initWithAvp:avp];
            _var_utran_vector = avp;
            [knownAVPs addObject:avp];
            if(_var_utran_vector == NULL)
            {
                _var_utran_vector = @[avp];
            }
            else
            {
                _var_utran_vector = [_var_utran_vector arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpGERAN_Vector avpCode])
        {
            avp = [[UMDiameterAvpGERAN_Vector alloc]initWithAvp:avp];
            _var_geran_vector = avp;
            [knownAVPs addObject:avp];
            if(_var_geran_vector == NULL)
            {
                _var_geran_vector = @[avp];
            }
            else
            {
                _var_geran_vector = [_var_geran_vector arrayByAddingObject:avp]
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

