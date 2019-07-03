//
//  UMDiameterAvpAMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAMBR.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_UL.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_DL.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_UL.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_DL.h"
#import "UMDiameterAvpAVP.h"

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
    if(_var_max_requested_bandwidth_ul)
    {
        [arr addObject:_var_max_requested_bandwidth_ul];
    }
    if(_var_max_requested_bandwidth_dl)
    {
        [arr addObject:_var_max_requested_bandwidth_dl];
    }
    if(_var_extended_max_requested_bw_ul)
    {
        [arr addObject:_var_extended_max_requested_bw_ul];
    }
    if(_var_extended_max_requested_bw_dl)
    {
        [arr addObject:_var_extended_max_requested_bw_dl];
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
        if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_UL  avpCode])
        {
            _var_max_requested_bandwidth_ul = [[UMDiameterAvpMax_Requested_Bandwidth_UL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_max_requested_bandwidth_ul];
        }
        else if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_DL avpCode])
        {
            _var_max_requested_bandwidth_dl = [[UMDiameterAvpMax_Requested_Bandwidth_DL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_max_requested_bandwidth_dl];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_UL avpCode])
        {
            _var_extended_max_requested_bw_ul = [[UMDiameterAvpExtended_Max_Requested_BW_UL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_extended_max_requested_bw_ul];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_DL avpCode])
        {
            _var_extended_max_requested_bw_dl = [[UMDiameterAvpExtended_Max_Requested_BW_DL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_extended_max_requested_bw_dl];
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

