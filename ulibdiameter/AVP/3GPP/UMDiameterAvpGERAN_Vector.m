//
//  UMDiameterAvpGERAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_item_number)
    {
        [arr addObject:_item_number]
    }
    if(_rand)
    {
        [arr addObject:_rand]
    }
    if(_sres)
    {
        [arr addObject:_sres]
    }
    if(_kc)
    {
        [arr addObject:_kc]
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
        else if(avp.avpCode == [UMDiameterAvpSRES avpCode])
        {
            avp = [[UMDiameterAvpSRES alloc]initWithAvp:avp];
            _sres = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpKc avpCode])
        {
            avp = [[UMDiameterAvpKc alloc]initWithAvp:avp];
            _kc = avp;
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

