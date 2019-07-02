//
//  UMDiameterAvpMBSFN_Area.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMBSFN_Area.h"
#import "UMDiameterAvpMBSFN_Area_ID.h"
#import "UMDiameterAvpCarrier_Frequency.h"
#import "UMDiameterAvpAVP.h"

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
    if(_var_mbsfn_area_id)
    {
        [arr addObject:_var_mbsfn_area_id];
    }
    if(_var_carrier_frequency)
    {
        [arr addObject:_var_carrier_frequency];
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
        if(avp.avpCode == [UMDiameterAvpMBSFN_Area_ID  avpCode])
        {
            _var_mbsfn_area_id = [[UMDiameterAvpMBSFN_Area_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mbsfn_area_id];
        }
        else if(avp.avpCode == [UMDiameterAvpCarrier_Frequency avpCode])
        {
            _var_carrier_frequency = [[UMDiameterAvpCarrier_Frequency alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_carrier_frequency];
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

