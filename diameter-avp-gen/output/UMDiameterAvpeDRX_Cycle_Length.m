//
//  UMDiameterAvpeDRX_Cycle_Length.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpeDRX_Cycle_Length


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length";
}

- (uint32_t)avpCode
{
    return 1691;
}

+ (uint32_t)avpCode
{
    return 1691;
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
    if(_rat_type)
    {
        [arr addObject:_rat_type]
    }
    if(_edrx_cycle_length_value)
    {
        [arr addObject:_edrx_cycle_length_value]
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
        if(avp.avpCode == [UMDiameterAvpRAT_Type  avpCode])
        {
            avp = [[UMDiameterAvpRAT_Type alloc]initWithAvp:avp];
            _rat_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpeDRX_Cycle_Length_Value avpCode])
        {
            avp = [[UMDiameterAvpeDRX_Cycle_Length_Value alloc]initWithAvp:avp];
            _edrx_cycle_length_value = avp;
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

