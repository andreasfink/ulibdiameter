//
//  UMDiameterAvpMBSFN_Area.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpMBSFN_Area


- (NSString *)avpType
{
    return @"MBSFN-Area";
}

- (uint32_t)avpCode
{
    return 1694;
}

+ (uint32_t)avpCode
{
    return 1694;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_mbsfn_area_id)
    {
        [arr addObject:_mbsfn_area_id]
    }
    if(_carrier_frequency)
    {
        [arr addObject:_carrier_frequency]
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
        if(avp.avpCode == [UMDiameterAvpMBSFN_Area_ID  avpCode])
        {
            avp = [[UMDiameterAvpMBSFN_Area_ID alloc]initWithAvp:avp];
            _mbsfn_area_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCarrier_Frequency avpCode])
        {
            avp = [[UMDiameterAvpCarrier_Frequency alloc]initWithAvp:avp];
            _carrier_frequency = avp;
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

