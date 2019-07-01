//
//  UMDiameterAvpAMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpAMBR


- (NSString *)avpType
{
    return @"AMBR";
}

- (uint32_t)avpCode
{
    return 1435;
}

+ (uint32_t)avpCode
{
    return 1435;
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
    if(_max_requested_bandwidth_ul)
    {
        [arr addObject:_max_requested_bandwidth_ul]
    }
    if(_max_requested_bandwidth_dl)
    {
        [arr addObject:_max_requested_bandwidth_dl]
    }
    if(_extended_max_requested_bw_ul)
    {
        [arr addObject:_extended_max_requested_bw_ul]
    }
    if(_extended_max_requested_bw_dl)
    {
        [arr addObject:_extended_max_requested_bw_dl]
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
        if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_UL  avpCode])
        {
            avp = [[UMDiameterAvpMax_Requested_Bandwidth_UL alloc]initWithAvp:avp];
            _max_requested_bandwidth_ul = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_DL avpCode])
        {
            avp = [[UMDiameterAvpMax_Requested_Bandwidth_DL alloc]initWithAvp:avp];
            _max_requested_bandwidth_dl = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_UL avpCode])
        {
            avp = [[UMDiameterAvpExtended_Max_Requested_BW_UL alloc]initWithAvp:avp];
            _extended_max_requested_bw_ul = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_DL avpCode])
        {
            avp = [[UMDiameterAvpExtended_Max_Requested_BW_DL alloc]initWithAvp:avp];
            _extended_max_requested_bw_dl = avp;
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

