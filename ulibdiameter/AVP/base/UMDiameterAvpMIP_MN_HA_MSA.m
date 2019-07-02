//
//  UMDiameterAvpMIP_MN_HA_MSA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:32:28.185000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MN_HA_MSA.h"
#import "UMDiameterAvpMIP_Session_Key.h"
#import "UMDiameterAvpMIP_MSA_Lifetime.h"
#import "UMDiameterAvpMIP_MN_HA_SPI.h"
#import "UMDiameterAvpMIP_Algorithm_Type.h"
#import "UMDiameterAvpMIP_Replay_Mode.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMIP_MN_HA_MSA


- (NSString *)avpType
{
    return @"MIP-MN-HA-MSA";
}

- (uint32_t)avpCode
{
    return 492;
}

+ (uint32_t)avpCode
{
    return 492;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_mip_session_key)
    {
        [arr addObject:_var_mip_session_key];
    }
    if(_var_mip_msa_lifetime)
    {
        [arr addObject:_var_mip_msa_lifetime];
    }
    if(_var_mip_mn_ha_spi)
    {
        [arr addObject:_var_mip_mn_ha_spi];
    }
    if(_var_mip_algorithm_type)
    {
        [arr addObject:_var_mip_algorithm_type];
    }
    if(_var_mip_replay_mode)
    {
        [arr addObject:_var_mip_replay_mode];
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
        if(avp.avpCode == [UMDiameterAvpMIP_Session_Key  avpCode])
        {
            _var_mip_session_key = [[UMDiameterAvpMIP_Session_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip_session_key];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP_MSA_Lifetime avpCode])
        {
            _var_mip_msa_lifetime = [[UMDiameterAvpMIP_MSA_Lifetime alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip_msa_lifetime];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP_MN_HA_SPI avpCode])
        {
            _var_mip_mn_ha_spi = [[UMDiameterAvpMIP_MN_HA_SPI alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip_mn_ha_spi];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP_Algorithm_Type avpCode])
        {
            _var_mip_algorithm_type = [[UMDiameterAvpMIP_Algorithm_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip_algorithm_type];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP_Replay_Mode avpCode])
        {
            _var_mip_replay_mode = [[UMDiameterAvpMIP_Replay_Mode alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip_replay_mode];
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

