//
//  UMDiameterAvpV2X_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpV2X_Subscription_Data


- (NSString *)avpType
{
    return @"V2X-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1688;
}

+ (uint32_t)avpCode
{
    return 1688;
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
    if(_v2x_permission)
    {
        [arr addObject:_v2x_permission]
    }
    if(_ue_pc5_ambr)
    {
        [arr addObject:_ue_pc5_ambr]
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
        if(avp.avpCode == [UMDiameterAvpV2X_Permission  avpCode])
        {
            avp = [[UMDiameterAvpV2X_Permission alloc]initWithAvp:avp];
            _v2x_permission = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpUE_PC5_AMBR avpCode])
        {
            avp = [[UMDiameterAvpUE_PC5_AMBR alloc]initWithAvp:avp];
            _ue_pc5_ambr = avp;
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

