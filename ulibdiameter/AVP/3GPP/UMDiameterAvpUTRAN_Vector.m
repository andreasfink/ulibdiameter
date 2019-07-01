//
//  UMDiameterAvpUTRAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Vector.h"

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
    if(_item_number)
    {
        [arr addObject:_item_number]
    }
    if(_rand)
    {
        [arr addObject:_rand]
    }
    if(_xres)
    {
        [arr addObject:_xres]
    }
    if(_autn)
    {
        [arr addObject:_autn]
    }
    if(_confidentiality_key)
    {
        [arr addObject:_confidentiality_key]
    }
    if(_integrity_key)
    {
        [arr addObject:_integrity_key]
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
        if(avp.avpCode == [UMDiameterAvpItem_Number  avpCode])
        {
            avp = [[UMDiameterAvpItem_Number alloc]initWithAvp:avp];
            _item_number = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRAND avpCode])
        {
            avp = [[UMDiameterAvpRAND alloc]initWithAvp:avp];
            _rand = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpXRES avpCode])
        {
            avp = [[UMDiameterAvpXRES alloc]initWithAvp:avp];
            _xres = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAUTN avpCode])
        {
            avp = [[UMDiameterAvpAUTN alloc]initWithAvp:avp];
            _autn = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpConfidentiality_Key avpCode])
        {
            avp = [[UMDiameterAvpConfidentiality_Key alloc]initWithAvp:avp];
            _confidentiality_key = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpIntegrity_Key avpCode])
        {
            avp = [[UMDiameterAvpIntegrity_Key alloc]initWithAvp:avp];
            _integrity_key = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

