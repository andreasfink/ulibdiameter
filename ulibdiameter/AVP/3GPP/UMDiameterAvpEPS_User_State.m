//
//  UMDiameterAvpEPS_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpEPS_User_State


- (NSString *)avpType
{
    return @"EPS-User-State";
}

- (uint32_t)avpCode
{
    return 1495;
}

+ (uint32_t)avpCode
{
    return 1495;
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
    if(_mme_user_state)
    {
        [arr addObject:_mme_user_state]
    }
    if(_sgsn_user_state)
    {
        [arr addObject:_sgsn_user_state]
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
        if(avp.avpCode == [UMDiameterAvpMME_User_State  avpCode])
        {
            avp = [[UMDiameterAvpMME_User_State alloc]initWithAvp:avp];
            _mme_user_state = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_User_State avpCode])
        {
            avp = [[UMDiameterAvpSGSN_User_State alloc]initWithAvp:avp];
            _sgsn_user_state = avp;
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

