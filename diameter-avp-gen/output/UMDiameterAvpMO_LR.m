//
//  UMDiameterAvpMO_LR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpMO_LR


- (NSString *)avpType
{
    return @"MO-LR";
}

- (uint32_t)avpCode
{
    return 1485;
}

+ (uint32_t)avpCode
{
    return 1485;
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
    if(_ss_code)
    {
        [arr addObject:_ss_code]
    }
    if(_ss_status)
    {
        [arr addObject:_ss_status]
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
        if(avp.avpCode == [UMDiameterAvpSS_Code  avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _ss_code = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Status avpCode])
        {
            avp = [[UMDiameterAvpSS_Status alloc]initWithAvp:avp];
            _ss_status = avp;
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

