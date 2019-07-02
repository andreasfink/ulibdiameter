//
//  UMDiameterAvpEPS_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_User_State.h"

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
    if(_var_mme_user_state)
    {
        [arr addObject:_var_mme_user_state];
    }
    if(_var_sgsn_user_state)
    {
        [arr addObject:_var_sgsn_user_state];
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpMME_User_State  avpCode])
        {
            avp = [[UMDiameterAvpMME_User_State alloc]initWithAvp:avp];
            _var_mme_user_state = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_User_State avpCode])
        {
            avp = [[UMDiameterAvpSGSN_User_State alloc]initWithAvp:avp];
            _var_sgsn_user_state = avp;
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

