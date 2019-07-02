//
//  UMDiameterAvpSGSN_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_User_State.h"
#import "UMDiameterAvpUser_State.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpSGSN_User_State


- (NSString *)avpType
{
    return @"SGSN-User-State";
}

- (uint32_t)avpCode
{
    return 1498;
}

+ (uint32_t)avpCode
{
    return 1498;
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
    if(_var_user_state)
    {
        [arr addObject:_var_user_state];
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
        if(avp.avpCode == [UMDiameterAvpUser_State  avpCode])
        {
            avp = [[UMDiameterAvpUser_State alloc]initWithAvp:avp];
            _var_user_state = avp;
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

