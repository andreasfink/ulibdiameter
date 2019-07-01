//
//  UMDiameterAvpAuthentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
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
    if(_e_utran_vector.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Vector *o in _e_utran_vector)
        {
            [arr addObject:o]
        }
    }
    if(_utran_vector.count > 0)
    {
        for(UMDiameterAvpUTRAN_Vector *o in _utran_vector)
        {
            [arr addObject:o]
        }
    }
    if(_geran_vector.count > 0)
    {
        for(UMDiameterAvpGERAN_Vector *o in _geran_vector)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpE_UTRAN_Vector  avpCode])
        {
            avp = [[UMDiameterAvpE_UTRAN_Vector alloc]initWithAvp:avp];
            _e_utran_vector = avp;
            [knownAVPs addObject:avp];
            if(_e_utran_vector == NULL)
            {
                _e_utran_vector = @[avp];
            }
            else
            {
                _e_utran_vector = [_e_utran_vector arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUTRAN_Vector avpCode])
        {
            avp = [[UMDiameterAvpUTRAN_Vector alloc]initWithAvp:avp];
            _utran_vector = avp;
            [knownAVPs addObject:avp];
            if(_utran_vector == NULL)
            {
                _utran_vector = @[avp];
            }
            else
            {
                _utran_vector = [_utran_vector arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpGERAN_Vector avpCode])
        {
            avp = [[UMDiameterAvpGERAN_Vector alloc]initWithAvp:avp];
            _geran_vector = avp;
            [knownAVPs addObject:avp];
            if(_geran_vector == NULL)
            {
                _geran_vector = @[avp];
            }
            else
            {
                _geran_vector = [_geran_vector arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

